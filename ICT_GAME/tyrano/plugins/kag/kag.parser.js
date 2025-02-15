tyrano.plugin.kag.parser={tyrano:null,kag:null,flag_script:!1,deep_if:0,init:function(){},loadConfig:function(call_back){var that=this;$.loadText("./data/system/Config.tjs",(function(text_str){var map_config=that.compileConfig(text_str);call_back&&call_back(map_config)}))},compileConfig:function(text_str){for(var error_str="",map_config={},array_config=text_str.split("\n"),i=0;i<array_config.length;i++)try{var line_str=$.trim(array_config[i]);if(""!=line_str&&";"===line_str.substr(0,1)){var tmp_comment=line_str.split("//");tmp_comment.length>1&&(line_str=$.trim(tmp_comment[0]));line_str=$.replaceAll(line_str,";","");var tmp=(line_str=$.replaceAll(line_str,'"',"")).split("="),key=$.trim(tmp[0]),val=$.trim(tmp[1]);map_config[key]=val}}catch(e){error_str+="Error:Config.tjsに誤りがあります/行:"+i}""!=error_str&&alert(error_str);return map_config},parseScenario:function(text_str){for(var array_s=[],map_label={},array_row=text_str.split("\n"),flag_comment=!1,i=0;i<array_row.length;i++){var line_str=$.trim(array_row[i]),first_char=line_str.substr(0,1);-1!=line_str.indexOf("endscript")&&(this.flag_script=!1);if(!0===flag_comment&&"*/"===line_str)flag_comment=!1;else if("/*"===line_str)flag_comment=!0;else if(1==flag_comment||";"===first_char);else if("#"===first_char){var tmp_line=$.trim(line_str.replace("#","")),chara_name="",chara_face="";if(tmp_line.split(":").length>1){var array_line=tmp_line.split(":");chara_name=array_line[0];chara_face=array_line[1]}else chara_name=tmp_line;var text_obj={line:i,name:"chara_ptext",pm:{name:chara_name,face:chara_face},val:""};array_s.push(text_obj)}else if("*"===first_char){var label_key,label_tmp=line_str.substr(1,line_str.length).split("|"),label_val="";label_key=$.trim(label_tmp[0]);label_tmp.length>1&&(label_val=$.trim(label_tmp[1]));var label_obj={name:"label",pm:{line:i,index:array_s.length,label_name:label_key,val:label_val},val:label_val};array_s.push(label_obj);map_label[label_obj.pm.label_name]?this.kag.warning("duplicate_label",{name:label_obj.pm.label_name}):map_label[label_obj.pm.label_name]=label_obj.pm}else if("@"===first_char){const tag_str=line_str.substr(1,line_str.length),tmpobj=this.makeTag(tag_str,i);array_s.push(tmpobj)}else{"_"===first_char&&(line_str=line_str.substring(1,line_str.length));let array_char=line_str.split(""),text="",tag_str="",scanning_tag=!1,deep_kakko=0,start_quot="",flag_escape=!1;for(var j=0;j<array_char.length;j++){var c=array_char[j];if(this.flag_script)text+=c;else if(scanning_tag)if("]"===c)if(""!==start_quot)tag_str+=c;else{deep_kakko--;if(0===deep_kakko){scanning_tag=!1;array_s.push(this.makeTag(tag_str,i));tag_str="";start_quot=""}else tag_str+=c}else if("["===c){""===start_quot&&deep_kakko++;tag_str+=c}else if('"'===c||"'"===c||"`"===c){start_quot===c?start_quot="":""===start_quot&&(start_quot=c);tag_str+=c}else tag_str+=c;else if(flag_escape){text+=c;flag_escape=!1}else if("["===c){scanning_tag=!0;deep_kakko++;if(""!=text){const text_obj={line:i,name:"text",pm:{val:text},val:text,is_entity_disabled:!0};array_s.push(text_obj);text=""}}else"\\"===c?flag_escape=!0:text+=c}if(tag_str){if("]"===tag_str.slice(-1)){const tag_str_fixed=tag_str.slice(0,tag_str.length-1);this.kag.warning("compensate_missing_quart",{before:tag_str,after:tag_str_fixed},!1);tag_str=tag_str_fixed}array_s.push(this.makeTag(tag_str,i))}text&&array_s.push({line:i,name:"text",pm:{val:text},val:text,is_entity_disabled:!0})}}this.kag.convertLang(this.kag.stat.current_scenario,array_s);var result_obj={array_s:array_s,map_label:map_label};if(0!=this.deep_if){this.kag.error("if_and_endif_do_not_match");this.deep_if=0}return result_obj},makeTag:function(str,line){var obj={line:line,name:"",pm:{},val:""},array_c=str.split(""),flag_escape=!1,scanning_state=1,tag_name="",param_name="",param_value="",end_char_of_param_value="",keepSpaceConfig=this.kag.config.KeepSpaceInParameterValue;function makeParam(){obj.pm[param_name]=param_value;var param_value_trim=$.trim(param_value);"undefined"===param_value_trim&&(obj.pm[param_name]="");"3"!==keepSpaceConfig&&(obj.pm[param_name]=param_value_trim)}for(var j=0;j<array_c.length;j++){var c=array_c[j];switch(scanning_state){case 1:" "===c?""===tag_name||(scanning_state=2):tag_name+=c;break;case 2:" "===c?""===param_name||(scanning_state=3):"="===c?scanning_state=4:param_name+=c;break;case 3:if("="===c)scanning_state=4;else if(" "===c);else{obj.pm[param_name]="";param_name=c;scanning_state=2}break;case 4:if('"'===c||"'"===c||"`"===c){end_char_of_param_value=c;scanning_state=5}else if(" "===c);else{end_char_of_param_value=" ";param_value=c;scanning_state=5}break;case 5:if(c===end_char_of_param_value)if(flag_escape){flag_escape=!1;param_value+=c}else{makeParam();param_name="";param_value="";end_char_of_param_value="";scanning_state=2}else{"`"!==end_char_of_param_value&&" "===c&&"1"===keepSpaceConfig&&(c="");flag_escape?param_value+=c:"\\"===c?flag_escape=!0:param_value+=c}}}""!==param_name&&makeParam();obj.name=tag_name;"iscript"==obj.name&&(this.flag_script=!0);"endscript"==obj.name&&(this.flag_script=!1);switch(obj.name){case"if":this.deep_if++;obj.pm.deep_if=this.deep_if;break;case"elsif":case"else":obj.pm.deep_if=this.deep_if;break;case"endif":obj.pm.deep_if=this.deep_if;this.deep_if--}return obj},test:function(){}};
