
[cm]

@clearstack
@bg storage ="automaton.jpg" time=100 
@wait time = 200

*start 
[button x=380 y=430 graphic="title/titlename2.png" visible=true ]
[button x=430 y=810 graphic="title/buttonk_start.png" enterimg="title/buttonk_start2.png"  target="gamestart" keyfocus="1" ]
[button x=850 y=810 graphic="title/buttonh_load.png" enterimg="title/buttonh_load2.png" role="load" keyfocus="2"]
;[button x=135 y=470 graphic="title/button_cg.png" enterimg="title/button_cg2.png" storage="cg.ks" keyfocus="3"]
;[button x=135 y=590 graphic="title/button_replay.png" enterimg="title/button_replay2.png" storage="replay.ks" keyfocus="4"]
;[button x=135 y=710 graphic="title/button_config.png" enterimg="title/button_config2.png" role="sleepgame" storage="config.ks" keyfocus="5"]

[s]

*gamestart
;一番最初のシナリオファイルへジャンプする
@jump storage="scene1.ks"



