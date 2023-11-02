

;//            サブルーチンで読み込み              //


;//オール裏画面イメージ解放



@iscript

	function AFIB()
	{
		for(var i = 0; i < kag.back.layers.count; i ++)
		{
			with(kag.back.layers[i])
			{
				.visible = false;
				.setSize(1, 1);
				.setImageSize(1, 1);
				.face = dfAlpha;
				.fillRect(0, 0, 1, 1, 0);
				.type = ltOpaque;
				.face = dfAuto;
			}
		}
	}

@endscript

@macro name="AllFreeimageBack"

[eval exp = "AFIB()"]

;//ベースだけ別で
[freeimage layer = "base" page = "back"]

@endmacro

@iscript

	function AFIF()
	{
		for(var i = 0; i < kag.fore.layers.count; i ++)
		{
			with(kag.fore.layers[i])
			{
				.visible = false;
				.setSize(1, 1);
				.setImageSize(1, 1);
				.face = dfAlpha;
				.fillRect(0, 0, 1, 1, 0);
				.type = ltOpaque;
				.face = dfAuto;
			}
		}
	}

@endscript

@macro name="AllFreeimageFore"

[eval exp = "AFIF()"]

;//ベースだけ別で
[freeimage layer = "base" page = "fore"]

@endmacro

;//メッセージウィンドウタグ/////////////////////
@macro name="EventMessageWindow"

@position layer=message1 visible=true page=%page|back left=0 top=565 width=300 height=35 opacity=0 marginl=100 margint=0 marginr=0 marginb=0
;@position layer=message0 visible=true page=%page|back left=0 top=0 width=800 height=600 frame="メッセージウィンドゥ_イベントシーン" marginl=159 margint=463 marginr=154 marginb=17
;@position layer=message0 visible=true page=%page|back left=0 top=0 width=800 height=800 frame="メッセージウインドアタリ" marginl=125 margint=512 marginr=154 marginb=17
;@position layer=message0 visible=true page=%page|back left=0 top=403 width=800 height=197 frame="メッセージウインドウ" marginl=75 margint=109 marginr=0 marginb=0
@position layer=message0 visible=true page=%page|back left=0 top=405 width=1230 height=197 frame="メッセージウインドウ" marginl=130 margint=200 marginr=0 marginb=0


@endmacro

;@macro name="MainMessageWindow"

;@position layer=message1 visible=true page=%page|back left=427 top=396 width=118 height=30 opacity=0 marginl=0 margint=0 marginr=0 marginb=0
;@position layer=message0 visible=true page=%page|back left=0 top=0 width=800 height=600 frame="メッセージウィンドゥ_通常" marginl=34 margint=455 marginr=275 marginb=25


;@endmacro


;//ページ末用タグ////////////////////////////////
@macro name="pcm"

;//オートモードの時、声の終了待ち
[ws buf = "&tf.VoiceBufNo" canskip = "true" cond = "kag.autoMode"]
;//手動読み進みの時、ページ末で待つことになる（音をワンクリックとばし）
;//音声待ち取捨選択、また音声再生中ウィンドウを消すことが出来る
[p]

;//何処でもセーブプラグインで作ったセーブラベル
[label]

;//履歴表示で改行
[hr]

;//文字クリア
[cm]

;//音声を止める
[stopse buf = "&tf.VoiceBufNo"]

@endmacro


;//音声////////////////////////////////////////////////
@macro name="voice"
[playse buf = "&tf.VoiceBufNo" storage = "%file" cond = "kag.se[tf.VoiceBufNo].volume2 != 0"]
@endmacro

;//音楽////////////////////////////////////////////////
@macro name="音楽"
[playse buf = "&tf.BGMBufNo" storage = "%file" loop = "true"]
@endmacro

;//音楽フェードアウト
@macro name="音楽フェードアウト"

[fadeoutse buf = "&tf.BGMBufNo" time = "%time|1000"]
[wf buf = "&tf.BGMBufNo" canskip = "true"]
[stopse buf = "&tf.BGMBufNo"]

@endmacro

;//音楽ストップ
@macro name="音楽ストップ"
[stopse buf = "&tf.BGMBufNo"]
@endmacro

;//効果音/////////////////////////////////////////////
@macro name="効果音"
[playse buf = "&tf.SEBufNo" loop = "%loop" storage = "%file"]
@endmacro

;//効果音フェードアウト
@macro name="効果音フェードアウト"

[fadeoutse buf = "&tf.SEBufNo" time = "%time|1000"]
[wf buf = "&tf.SEBufNo" canskip = "true"]
[stopse buf = "&tf.SEBufNo"]

@endmacro

;//効果音ストップ
@macro name="効果音ストップ"
[stopse buf = "&tf.SEBufNo"]
@endmacro


;//環境音/////////////////////////////////////////////
@macro name="環境音"
[playse buf = "&tf.SE2BufNo" loop = "%loop" storage = "%file"]
@endmacro

;//環境音フェードアウト
@macro name="環境音フェードアウト"

[fadeoutse buf = "&tf.SE2BufNo" time = "%time|1000"]
[wf buf = "&tf.SE2BufNo" canskip = "true"]
[stopse buf = "&tf.SE2BufNo"]

@endmacro

;//環境音ストップ
@macro name="環境音ストップ"
[stopse buf = "&tf.SE2BufNo"]
@endmacro


;//揺れ////////////////////////////////////////////////

@macro name = "弱_横揺れ"
[quake time=500 hmax=25 vmax=0]
@endmacro

@macro name = "弱_縦揺れ"
[quake time=500 hmax=0 vmax=25]
@endmacro

@macro name = "弱_全体揺れ"
[quake time=1000 hmax=25 vmax=25]
@endmacro

@macro name = "強_横揺れ"
[quake time=1000 hmax=55 vmax=0]
@endmacro

@macro name = "強_縦揺れ"
[quake time=1000 hmax=0 vmax=55]
@endmacro

@macro name = "強_全体揺れ"
[quake time=1000 hmax=55 vmax=55]
@endmacro

@macro name = "揺れ待機"
[wq canskip = true]
[stopquake]
@endmacro


;//エフェクトプリセット//////////////////////////////////////////

@macro name="絶頂_小(射精無)"
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
[playse buf = "2" loop = "fales" storage = "【SE】潮吹き.ogg"]
@endmacro

@macro name="絶頂_小"
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
[playse buf = "2" loop = "fales" storage = "【SE】射精音1.ogg"]
@endmacro

@macro name="絶頂_大(射精無)"
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
[playse buf = "2" loop = "fales" storage = "【SE】潮吹き.ogg"]
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
@endmacro

@macro name="絶頂_大"
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
[playse buf = "2" loop = "fales" storage = "【SE】射精音2.ogg"]
[image storage = "白_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
@endmacro

@macro name="絶頂_致死(射精無)"
[playse buf = "2" loop = "fales" storage = "【SE】ぬちゅ１.ogg"]
[image storage = "赤_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[image storage = "赤_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
[playse buf = "2" loop = "fales" storage = "【SE】潮吹き.ogg"]
[image storage = "赤_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
@endmacro

@macro name="絶頂_致死"
[playse buf = "2" loop = "fales" storage = "【SE】ぬちゅ１.ogg"]
[image storage = "赤_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[image storage = "赤_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
[playse buf = "2" loop = "fales" storage = "【SE】射精音3.ogg"]
[image storage = "赤_1280-720.png" layer = "3" page = "fore" visible = "true"]
[backlay]
[image storage = "透明_1280-720.png" layer = "3" page = "back" visible = "true"]
[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]
[freeimage layer = "3" page = "fore"]
[freeimage layer = "3" page = "back"]
[quake time=500 hmax=0 vmax=25]
@endmacro

;//フラッシュ//////////////////////////////////////////
@macro name = "フラッシュ"

[stoptrans]

[image storage = "白_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "fore" visible = "true" cond = "mp.type == '白'"]
[image storage = "黒_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "fore" visible = "true" cond = "mp.type == '黒'"]
[image storage = "赤_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "fore" visible = "true" cond = "mp.type == '赤'"]
[image storage = "青_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "fore" visible = "true" cond = "mp.type == '青'"]

[backlay]

[image storage = "透明_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "back" visible = "true"]

[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]

[freeimage layer = "&tf.EffectGraphicLayerNo" page = "fore"]
[freeimage layer = "&tf.EffectGraphicLayerNo" page = "back"]

@endmacro

;//フェードイン////////////////////////////////////////
@macro name="フェードＯＦＦ"

[stoptrans]
[backlay]
;//トランス先の表レイヤーの大きさを合わせる
[image storage = "透明_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "back" visible = "true"]

[trans method = "crossfade" time = "%time|500"]
[wt]
[stoptrans]

[freeimage layer = "&tf.EffectGraphicLayerNo" page = "fore"]
[freeimage layer = "&tf.EffectGraphicLayerNo" page = "back"]

@endmacro


;//フェードアウト////////////////////////////////////
@macro name="フェードＯＮ"

[stoptrans]
[backlay]

[image storage = "白_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "back" visible = "true" cond = "mp.type == '白'"]
[image storage = "黒_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "back" visible = "true" cond = "mp.type == '黒'"]
[image storage = "赤_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "back" visible = "true" cond = "mp.type == '赤'"]
[image storage = "青_1280-720.png" layer = "&tf.EffectGraphicLayerNo" page = "back" visible = "true" cond = "mp.type == '青'"]

[trans method = "crossfade" time = "%time|500"]
[wt]
[stoptrans]

[freeimage layer = "&tf.EffectGraphicLayerNo" page = "back"]

@endmacro


;//メインCG切り替え、自動読み進み対応////////////////
@macro name="イベント絵表示"

[stoptrans]

[backlay]
[AllFreeimageBack]

[image storage = "%file" page = "back" layer = "&tf.EventGraphicLayerNo"]
[layopt layer = "message1" visible = "false" page = "back"]
[layopt layer = "message0" visible = "false" page = "back"]


[trans method = "crossfade" time = "%time|1000"]
[wt]
[stoptrans]
;↓立ち絵の表画像を消去するのでトランスで不具合が生じる、それを防ぐために現在表に何も張られていないことを知らせるための変数計算
[eval exp="f.人物記憶領域 = 0"]

;//もし自動読み進みモードならば
[if exp="kag.autoMode"]
[wait time="500"]
[else]
[wait time="1000"]
[endif]


[backlay]
;//バックグラウンドにCGモード用メッセージウィンドウ
[EventMessageWindow]

[trans method = "crossfade" time = "1000"]
[wt]
[stoptrans]

@endmacro


;//アイキャッチ/////////////////////////////////////////////////
@macro name="アイキャッチ"
[stoptrans]
[backlay]
[AllFreeimageBack]

[layopt layer = "message" visible = "false" page = "back"]

@eval exp="f.乱数 = intrandom(1, 4)"
[eval exp="f.IM = '【アイキャッチ】' + f.乱数 + '.bmp'"]

[image storage = "&f.IM" page = "back" layer = "base" visible = "true" left = "0" top = "0"]

[trans method = "universal" rule = "chk" vague = "0" time = "500"]
[wt]
[stoptrans]
;↓立ち絵の表画像を消去するのでトランスで不具合が生じる、それを防ぐために現在表に何も張られていないことを知らせるための変数計算
[eval exp="f.人物記憶領域 = 0"]

;//もし自動読み進みモードならば
[if exp="kag.autoMode"]
[wait time="2000"]
[else]
[wait time="4000"]
[endif]

[freeimage layer = "base" page = "back"]
;//アイキャッチ後画面

[trans method = "universal" rule = "chk" vague = "0" time = "500"]
[wt]
[stoptrans]


@endmacro


;//背景画像表示////////////////////////////////////////////
@macro name="会話シーン"

[cm]
[stoptrans]

[backlay]
[AllFreeimageBack]

;//会話シーンバック
;↓現状は覆いかぶさるので必要ない/181015
[image storage = "黒_1280-720.png" page = "back" left = "0" top = "0" layer = "&tf.MainDisplayGraphicLayerNo" visible = "true"]

;//会話シーン背景
;↓左上を基準にした画像を追加しているだけなので800×600のものを表示すればよい/181015
[image storage = "%file" page = "back" left = "0" top = "0" layer = "&tf.BackgroundGraphicLayerNo" visible = "true" cond = "mp.file !== void"]

;//会話モードウインドウをバックに読み込み
;[MainMessageWindow]
[EventMessageWindow]


[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]

;↓立ち絵の表画像を消去するのでトランスで不具合が生じる、それを防ぐために現在表に何も張られていないことを知らせるための変数計算
[eval exp="f.人物記憶領域 = 0"]


@endmacro


;//場面転換///////////////////////////////////////////////
@macro name="会話シーン移動"

[stoptrans]

[image storage = "%file" page = "back" layer = "&tf.BackgroundGraphicLayerNo" left = "0" top = "0" visible = "true"]
[trans method = "universal" rule = "bla" vague = "128" time = "1500" layer = "&tf.BackgroundGraphicLayerNo"]
[wt]
[stoptrans]

@endmacro


;//人物////////////////////////////////////////////////
@macro name="人物"
;立ち絵が表面に存在しない状態でトランスするとエラーが生じるそのため表に仮の透明レイヤーを貼り付ける
[image storage= "透明_1280-720.png" page= "fore" left = "0" top = "0" layer = "&tf.CharacterGraphicLayerNo" visible = "true" cond="f.人物記憶領域 == 0 || f.人物記憶領域 == void"]


[image storage= "%file" page= "back" left = "0" top = "0" layer = "&tf.CharacterGraphicLayerNo" visible = "true"]
[trans layer = "&tf.CharacterGraphicLayerNo" method = "crossfade" time = "250"]
[wt]
[stoptrans]
;↓立ち絵の表画像が存在することを知らせるための変数計算
[eval exp="f.人物記憶領域 = 1"]
@endmacro

@macro name="人物消去"
[image storage= "透明_1280-720.png" page= "back" left = "0" top = "0" layer = "&tf.CharacterGraphicLayerNo" visible = "true"]
[trans layer = "&tf.CharacterGraphicLayerNo" method = "crossfade" time = "250"]
[wt]
[stoptrans]
[freeimage layer = "&tf.CharacterGraphicLayerNo" page = "fore"]
;↓立ち絵の表画像を消去するのでトランスで不具合が生じる、それを防ぐために現在表に何も張られていないことを知らせるための変数計算
[eval exp="f.人物記憶領域 = 0"]
@endmacro

;//カットイン///////////////////////////////////////////
@macro name="カットイン"
[image storage = "%file" page = "fore" left = "0" top = "0" layer = "&tf.CutGraphicLayerNo" visible = "true"]
@endmacro

@macro name="カットイン消去"
[freeimage layer = "&tf.CutGraphicLayerNo" page = "fore"]
@endmacro


;//登場人物名前////////////////////////////////////

;//必要に応じて追加してください。
;//記載ルールは
;//macro name="タグの名前"、ch text="名前欄に出る文字"
;//です。
@macro name="タグの名前適当に"
@current layer=message1
@style align=center
@ch text="名前欄文字列"
@current layer=message0
@endmacro

@macro name="　　　"
@current layer=message1
@style align=center
@ch text="　　　"
@current layer=message0
@endmacro

@macro name="？？？"
@current layer=message1
@style align=center
@ch text="？？？"
@current layer=message0
@endmacro

@macro name="???"
@current layer=message1
@style align=center
@ch text="???"
@current layer=message0
@endmacro

@macro name="サトミ"
@current layer=message1
@style align=center
@ch text="Satomi"
@current layer=message0
@endmacro

@macro name="ルルア"
@current layer=message1
@style align=center
@ch text="Lulua"
@current layer=message0
@endmacro

@macro name="カノ"
@current layer=message1
@style align=center
@ch text="Kano"
@current layer=message0
@endmacro

@macro name="加江田"
@current layer=message1
@style align=center
@ch text="Kaida"
@current layer=message0
@endmacro

@macro name="デヴィ"
@current layer=message1
@style align=center
@ch text="Devi"
@current layer=message0
@endmacro

@macro name="ノッホ"
@current layer=message1
@style align=center
@ch text="Nocho"
@current layer=message0
@endmacro

@macro name="葉桜"
@current layer=message1
@style align=center
@ch text="Hanzakura"
@current layer=message0
@endmacro

@macro name="男子生徒"
@current layer=message1
@style align=center
@ch text="Male student"
@current layer=message0
@endmacro

@macro name="男子生徒A"
@current layer=message1
@style align=center
@ch text="Male student A"
@current layer=message0
@endmacro

@macro name="男子生徒B"
@current layer=message1
@style align=center
@ch text="Male student B"
@current layer=message0
@endmacro

@macro name="男子生徒C"
@current layer=message1
@style align=center
@ch text="Male student C"
@current layer=message0
@endmacro

@macro name="エマ"
@current layer=message1
@style align=center
@ch text="Emma"
@current layer=message0
@endmacro

@macro name="払田"
@current layer=message1
@style align=center
@ch text="Haruda"
@current layer=message0
@endmacro

@macro name="大津"
@current layer=message1
@style align=center
@ch text="Otsu"
@current layer=message0
@endmacro

@macro name="坂川"
@current layer=message1
@style align=center
@ch text="Sakagawa"
@current layer=message0
@endmacro

@macro name="数学教師"
@current layer=message1
@style align=center
@ch text="数学教師"
@current layer=message0
@endmacro

@macro name="夏野"
@current layer=message1
@style align=center
@ch text="Natsuno"
@current layer=message0
@endmacro

@macro name="夏野刑事"
@current layer=message1
@style align=center
@ch text="Detective Natsuno"
@current layer=message0
@endmacro

@macro name="男A"
@current layer=message1
@style align=center
@ch text="Boy A"
@current layer=message0
@endmacro

@macro name="男B"
@current layer=message1
@style align=center
@ch text="Boy B"
@current layer=message0
@endmacro

@macro name="男C"
@current layer=message1
@style align=center
@ch text="Boy C"
@current layer=message0
@endmacro

@macro name="男D"
@current layer=message1
@style align=center
@ch text="Boy D"
@current layer=message0
@endmacro

@macro name="男E"
@current layer=message1
@style align=center
@ch text="Boy E"
@current layer=message0
@endmacro

@macro name="男F"
@current layer=message1
@style align=center
@ch text="Boy F"
@current layer=message0
@endmacro

@macro name="男G"
@current layer=message1
@style align=center
@ch text="Boy G"
@current layer=message0
@endmacro

@macro name="客A"
@current layer=message1
@style align=center
@ch text="Customer A"
@current layer=message0
@endmacro

@macro name="客B"
@current layer=message1
@style align=center
@ch text="Customer B"
@current layer=message0
@endmacro

@macro name="客C"
@current layer=message1
@style align=center
@ch text="Customer C"
@current layer=message0
@endmacro

@macro name="女子生徒"
@current layer=message1
@style align=center
@ch text="Schoolgirl"
@current layer=message0
@endmacro

@macro name="陽子"
@current layer=message1
@style align=center
@ch text="Yoko"
@current layer=message0
@endmacro

@macro name="瑠衣"
@current layer=message1
@style align=center
@ch text="Rui"
@current layer=message0
@endmacro

@macro name="クイーン"
@current layer=message1
@style align=center
@ch text="Queen"
@current layer=message0
@endmacro

@macro name="ヴァレリー"
@current layer=message1
@style align=center
@ch text="Valeri"
@current layer=message0
@endmacro

@macro name="ゾアン"
@current layer=message1
@style align=center
@ch text="Zoan"
@current layer=message0
@endmacro

@macro name="サトミ＆エマ"
@current layer=message1
@style align=center
@ch text="Satomi＆Emma"
@current layer=message0
@endmacro


;//必要に応じて追加してください。
;//記載ルールは
;//macro name="タグの名前"、ch text="名前欄に出る文字"
;//です。


;//回想時文字表示準備//////////////////////////////////
@macro name="msstat"

@stoptrans

;//音楽フェードアウト
[音楽フェードアウト time = "100"]


;//回想中の動作事項
;//右クリック可能
@rclick enabled=true
;//セーブ不可
@store enabled=false
@endmacro



;//ＣＧギャラリーＣＧ表示/////////////////////////////////////////////

@macro name = "cgview"
[stoptrans]
[backlay]

[AllFreeimageBack]
[image storage = "%file" page = "back" layer = "base"]

[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]

;↓立ち絵の表画像を消去するのでトランスで不具合が生じる、それを防ぐために現在表に何も張られていないことを知らせるための変数計算
[eval exp="f.人物記憶領域 = 0"]

[waitclick]
@endmacro





;//スタッフロール

@macro name = "スタッフロール"

[backlay]
[AllFreeimageBack]
[image storage = "%file" page = "back" layer = "&tf.EventGraphicLayerNo"]
[trans method = crossfade time = 1000]
[wt canskip = "false"]
[stoptrans]
[wait time = "6300" canskip = "false"]
[backlay]
[AllFreeimageBack]
[trans method = crossfade time = 1000]
[wt canskip = "false"]
[stoptrans]

;↓立ち絵の表画像を消去するのでトランスで不具合が生じる、それを防ぐために現在表に何も張られていないことを知らせるための変数計算
[eval exp="f.人物記憶領域 = 0"]

@endmacro


@macro name="playvideoset"
@video slot = "0" visible = "true" loop = "%loop" mode = "layer"
@videolayer slot = "0" channel = "1" page = "%page" layer = "base"
@openvideo slot = "0" storage = "%filename"
@preparevideo slot = "0"
@wp slot = "0" for = "prepare"
@playvideo slot = "0"
@endmacro




@return
@s
;//                     サブルーチン読出戻り                      //
