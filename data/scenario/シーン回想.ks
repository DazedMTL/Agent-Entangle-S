;//ＣＧギャラリー//////////////////////////////////////////
*CG_gallery
[stopquake]
[stoptrans]
[stopse buf = "0"]
[stopse buf = "1"]
[stopse buf = "2" cond="tf.回想モード中 ==1"]
[backlay]
[AllFreeimageBack]

;回想モード用フラグ付与
[eval exp = "tf.回想モード中 = 1"]

[position layer=message0 visible=true page=back frame="" visible="false"]
[position layer=message0 visible=true page=fore frame="" visible="false"]
;[layopt layer = "message1" visible = "false"]
;[layopt layer = "message0" visible = "false"]
;[cm]
[rclick enabled=false]
[history output=false enabled=false]
;//セーブ・ロード機能復帰
[store enabled = "false"]

*CG
[image storage = "【シーン回想】ベース.png" page = "back" layer = "base"]

;システムフラグによって画像追加
[pimage storage = "【重要】00_1サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読00_1 == 1"]
[pimage storage = "【重要】00_2サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読00_2 == 1"]
[pimage storage = "【重要】A01サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読A01 == 1"]
[pimage storage = "【重要】A02サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読A02 == 1"]
[pimage storage = "【重要】A03サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読A03 == 1"]
[pimage storage = "【重要】A04サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読A04 == 1"]
[pimage storage = "【重要】A05サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読A05 == 1"]
[pimage storage = "【重要】A06サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読A06 == 1"]
[pimage storage = "【重要】B01サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読B01 == 1"]
[pimage storage = "【重要】B02サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読B02 == 1"]
[pimage storage = "【重要】B03サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読B03 == 1"]
[pimage storage = "【重要】B04サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読B04 == 1"]
[pimage storage = "【重要】B05サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読B05 == 1"]
[pimage storage = "【重要】B06サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読B06 == 1"]
[pimage storage = "【重要】C01サムネ.png" layer = "base" page = "back" dx = "0" dy = "0" cond = "sf.既読C01 == 1"]

[trans method = "crossfade" time = "500"]
[wt]
[stoptrans]

[s]



;//シーン回想//////////////////////////////////////////

*タイトルに戻る
;//回想シーン判定変数削除
[eval exp = "delete tf.回想モード中"]
;//セーブ・ロード機能復帰
[store enabled = "true"]
;//セーブ機能停止
[disablestore]
[jump storage = "first.ks" target = "*menu_top"]
[s]
