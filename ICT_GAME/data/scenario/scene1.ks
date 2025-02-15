;クイズ

*start

[cm  ]
[clearfix]
[start_keyconfig]

[bg storage="room.jpg" time="100"]

;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=160 top=870 width=1200 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=810]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと"#"の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;akane
[chara_new  name="akane" storage="chara/akane/silhouette.png" jname="あかね"]
;キャラクターの表情登録
[chara_face name="akane" face="angry" storage="chara/akane/angry.png"]
[chara_face name="akane" face="doki" storage="chara/akane/doki.png"]
[chara_face name="akane" face="happy" storage="chara/akane/happy.png"]
[chara_face name="akane" face="sad" storage="chara/akane/sad.png"]
[chara_face name="akane" face="normal" storage="chara/akane/normal.png"]


;yamato
[chara_new  name="yamato"  storage="chara/yamato/normal.png" jname="やまと" ]

#
こんにちは[p]

このゲームでは情報分野に関する簡単な問題を、[p]
何問か出題していきます。[p]
それでは早速......[p]

[font  size="30"   ]
#?
ちょっとまったーーーーー[p]
[resetfont  ]

#
？？？？？？？？？？？？？？？？？？？？？？？？[p]

;キャラクター登場
[chara_show  name="akane" top=350 width="480" height="718.8"]
#?
ただ問題を表示するだけのゲームなんて...[p]
[chara_mod  name="akane" face="angry"]
花がないでしょ！！！[p]
[chara_mod name="akane" face="normal"]
#あかね
はじめまして、私の名前はあかね[p]
ここからは私が進行役としてクイズを出題するわね[p]

[chara_mod  name="akane" face="happy"]
それじゃあ行ってみよう！[p]

; 正解数をカウントするscore関数の初期化処理
[eval exp="score=0"]

第１問！[p]
[chara_mod  name="akane" face="normal"]
OSI参照モデルで、データの暗号化や解読を行うのはどの層でしょう？[p]

[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="400"  text="1.アプリケーション層"  target="*sel1.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="500"  text="2.プレゼンテーション層"  target="*sel1.correct "]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="600"  text="3.トランスポート層"  target="*sel1.wrong"  ]
[s  ]

*sel1.wrong
[chara_mod  name="akane" face="sad"]
ざんねーん.....[p]
[chara_mod  name="akane" face="normal"]
正解は２番のプレゼンテーション層でした！[p]
大丈夫、まだ問題はたくさんあるから[p]
@jump target=*common1

*sel1.correct
[eval exp="score += 1"]
[chara_mod  name="akane" face="happy"]
せいかい！もしかして天才？[p]
それじゃあこの調子で、次も行ってみよう！[p]
@jump target=*common1

*common1
[chara_mod  name="akane" face="happy"]
第２問！[p]
[chara_mod  name="akane" face="normal"]
プログラムのバグを取り除く作業をなんと言うでしょう？[p]

[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="400"  text="1.デバッグ"  target="*sel2.correct"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="500"  text="2.コンパイル"  target="*sel2.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="600"  text="3.トラフィック"  target="*sel2.wrong"  ]
[s  ]

*sel2.wrong
[chara_mod  name="akane" face="sad"]
おしい〜......[p]
[chara_mod  name="akane" face="normal"]
正解は１番のデバッグでした！[p]
気を取り直して次がんばろっ！[p]
@jump target=*common2

*sel2.correct
[eval exp="score += 1"]
[chara_mod  name="akane" face="happy"]
せいかい！良い調子だね♪[p]
@jump target=*common2

*common2
[chara_mod  name="akane" face="happy"  ]
どんどん次に行ってみよう！[p]
第３問[p]
[chara_mod  name="akane" face="normal"]
「SQL」でデータを取得するために使われるコマンドはどれしょう？

[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="400"  text="1.INSERT"  target="*sel3.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="500"  text="2.DELETE"  target="*sel3.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="600"  text="3.SELECT"  target="*sel3.correct"  ]
[s  ]

*sel3.wrong
[chara_mod  name="akane" face="sad"]
あちゃぁ....ざんねん...[p]
[chara_mod  name="akane" face="normal"]
正解は3番のSELECTでした！[p]
まぁ、こんな日があってもいいよね！[p]
@jump target=*common3

*sel3.correct
[eval exp="score += 1"]
[chara_mod  name="akane" face="happy"]
せいかい！[p]
もしかして私よりも頭がいいかも...？[p]
[chara_mod  name="akane" face="normal"]
@jump target=*common3

*common3
いよいよ折り返しだよ！頑張って！[p]
[chara_mod  name="akane" face="happy"]
第４問！[p]
[chara_mod  name="akane" face="normal"]
「IPv4」アドレスの長さは何ビットでしょう？[p]

[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="400"  text="1.  32ビット"  target="*sel4.correct"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="500"  text="2.  64ビット"  target="*sel4.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="440"  width="500"  y="600"  text="3.  128ビット"  target="*sel4.wrong"  ]
[s  ]

*sel4.wrong
[chara_mod  name="akane" face="normal"]
............[p]
[chara_mod  name="akane" face="sad"]
ざんねん！[p]
[chara_mod  name="akane" face="normal"]
正解は1番の32ビットでした！[p]
@jump target=*common4

*sel4.correct
[eval exp="score += 1"]
............[p]
[chara_mod  name="akane" face="happy"]
せいかい！簡単すぎたかな？[p]
@jump target=*common4

*common4
[chara_mod  name="akane" face="normal"]
あともうちょっと！最後まで頑張って！[p]
[chara_mod  name="akane" face="happy"]
第５問！[p]
[chara_mod  name="akane" face="normal"]
「ウォーターフォール・モデル」の説明として最も適切なのはどれでしょう？[p]

[glink  color="blue"  storage="scene1.ks"  size="32"  x="360"  width="750"  y="400"  text="1.開発プロセスを並行して進める"  target="*sel5.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="360"  width="750"  y="500"  text="2.各工程を順番に進める" target="*sel5.correct"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="360"  width="750"  y="600"  text="3.チーム全員がリアルタイムでコードを共有する"  target="*sel5.wrong"  ]
[s  ]

*sel5.wrong
[chara_mod  name="akane" face="sad"]
んーざんねん！[p]
[chara_mod  name="akane" face="normal"]
正解は２番の「各工程を順番に進める」でした！
@jump target=*common5

*sel5.correct
[eval exp="score += 1"]
[chara_mod  name="akane" face="happy"]
おー！せいかい！[p]
[chara_mod  name="akane" face="normal"]
もしかして、開発経験者？[p]
@jump target=*common5

*common5
[chara_mod  name="akane" face="happy"]
次はいよいよ最後の問題だよ！気を引き締めてね！[p]
第６問！[p]
[chara_mod  name="akane" face="normal"]
コンピュータの「仮想メモリ」の主な役割の説明として最も適しているのはどれでしょう？[p]

[glink  color="blue"  storage="scene1.ks"  size="32"  x="360"  width="750"  y="400"  text="1.メモリの容量を物理的に増やす"  target="*sel6.wrong"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="360"  width="750"  y="500"  text="2.ハードディスクを一時的にメモリとして使用する" target="*sel6.correct"  ]
[glink  color="blue"  storage="scene1.ks"  size="32"  x="360"  width="750"  y="600"  text="3.プロセッサの処理速度を向上させる"  target="*sel6.wrong"  ]
[s  ]

*sel6.wrong
[chara_mod  name="akane" face="sad"]
んーざんねん！[p]
[chara_mod  name="akane" face="normal"]
正解は２番の「各工程を順番に進める」でした！
@jump target=*common6

*sel6.correct
[eval exp="score += 1"]
[chara_mod  name="akane" face="happy"]
おー！せいかい！[p]
[chara_mod  name="akane" face="normal"]
もしかして、開発経験者？[p]
@jump target=*common6

*common6
[chara_mod  name="akane" face="happy"]
はい！これでクイズはおしまいだよ！[p]
それじゃあ早速結果発表をしよっか！[p]
[chara_mod name="akane" face="normal"]

[if exp="score == 6"]
今回のきみの正解数は....[p]
[chara_mod name="akane" face="happy"]
[emb exp="score"]問でした！[p]
おめでとう！全問正解だよ！[p]
きみは情報分野の達人だね！[p]

[elsif exp="score >= 3"]
今回のきみの正解数は...[p]
[chara_mod name="akane" face="happy"]
[emb exp="score"]問でした！[p]
お疲れさま！[p]
良い成績だったね！あともう少しで満点だったよ！[p]

[elsif exp="score > 0"]
きみの正解数は...[p]
[emb exp="score"]問でした！[p]
まだまだ伸びしろがあるね！[p]
[chara_mod name="akane" face="happy"]
もっと正解数を増やせるように頑張っていこう！[p]

[else]
きみの正解数は...[p]
[chara_mod name="akane" face="sad"]
[emb exp="score"]問でした...[p]
[chara_mod name="akane" face="normal"]
今回の結果は残念だったけど、これから頑張ればきっと全問正解できるようになるよ！[p]
[chara_mod name="akane" face="happy"]
わたしも応援してるね！[p]
[endif]

それじゃあ！今回のゲームはこれでおしまい！[p]
また遊んでね！ばいばい〜！[p]

[chara_hide name="akane"]
[position layer="message0" visible=false]
@layopt layer=message0 visible=false

@jump storage="title.ks"