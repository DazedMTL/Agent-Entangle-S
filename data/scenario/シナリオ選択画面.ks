;//インターミッション分岐
[cancelskip]
[layopt layer = "message1" visible = "false"]
[layopt layer = "message0" visible = "false"]
[フェードＯＮ type = "黒" time = "500"]
[image storage = "【シーン選択】ベース.png" page = "fore" left = "0" top = "0" Layer = "Base" visible ="true"]
[wt]
[フェードＯＦＦ]


;ベストエンドルートに乗った場合
;[if exp="f.IMカウンタ >= 3"]
;[pimage storage = "【シーン選択】統合ルート進行1サムネ.png" page = "fore" visible ="true"Layer = "Base" dx = "0" dy = "0" cond = "f.IMカウンタ == 3"]
;[pimage storage = "【シーン選択】統合ルート進行2サムネ.png" page = "fore" visible ="true"Layer = "Base" dx = "0" dy = "0" cond = "f.IMカウンタ == 4"]

;[mapaction storage = "【シーン選択】ベース統合ルート.ma" Layer = "Base" page = "fore"]
;[mapimage storage = "【シーン選択】ベース統合ルート_p.png" Layer = "Base" page = "fore"]
;[s]
;[endif]
;ベストエンドルートに乗っていない場合
;[if exp="f.IMカウンタ != 3"]
[image storage = "透明_1280-720.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0"]
;IM進行サムネ
[pimage storage = "【シーン選択】IM1サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Aカウンタ >= 1 && f.Bカウンタ >= 1 && f.IMカウンタ == void"]
[pimage storage = "【シーン選択】IM2サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Aカウンタ >= 2 && f.Bカウンタ >= 2 && f.IMカウンタ == 1"]
[pimage storage = "【シーン選択】IM3サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Aカウンタ >= 3 && f.Bカウンタ >= 3 && f.IMカウンタ == 2 && sf.ED通過 == 1"]
[pimage storage = "【シーン選択】C01サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.IMカウンタ == 3"]

;A進行サムネ
[pimage storage = "【シーン選択】A01サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.IMカウンタ != 3"]
[pimage storage = "【シーン選択】A02サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Aカウンタ == 1 && f.IMカウンタ != 3"]
[pimage storage = "【シーン選択】A03サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Aカウンタ == 2 && f.IMカウンタ != 3"]
[pimage storage = "【シーン選択】A04サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Aカウンタ == 3 && f.IMカウンタ != 3"]

;B進行サムネ
[pimage storage = "【シーン選択】B01サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.IMカウンタ != 3"]
[pimage storage = "【シーン選択】B02サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Bカウンタ == 1 && f.IMカウンタ != 3"]
[pimage storage = "【シーン選択】B03サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Bカウンタ == 2 && f.IMカウンタ != 3"]
[pimage storage = "【シーン選択】B04サムネ.png" page = "fore" visible ="true"Layer = "1" dx = "0" dy = "0" cond = "f.Bカウンタ == 3 && f.IMカウンタ != 3"]

;[mapaction storage = "【シーン選択】ベース.ma" Layer = "1" page = "fore"]
;[mapimage storage = "【シーン選択】ベース_p.png" Layer = "1" page = "fore"]
;[endif]

[s]


*IMシナリオ選択
[イベント絵表示 file = "【イベント】黒.BMP"]
[freeimage layer = 1]
@eval exp = "f.IMカウンタ += 1"
@jump storage = "IM1.ks" cond = "f.IMカウンタ == 1"
@jump storage = "IM2.ks" cond = "f.IMカウンタ == 2"
@jump storage = "IM3.ks" cond = "f.IMカウンタ == 3"
@jump storage = "C01.ks" cond = "f.IMカウンタ == 4"
[s]

*Aシナリオ選択
[イベント絵表示 file = "【イベント】黒.BMP"]
[freeimage layer = 1]
@eval exp = "f.Aカウンタ += 1"
@jump storage = "A01.ks" cond = "f.Aカウンタ == 1"
@jump storage = "A02.ks" cond = "f.Aカウンタ == 2"
@jump storage = "A03.ks" cond = "f.Aカウンタ == 3"
@jump storage = "A04.ks" cond = "f.Aカウンタ == 4"
[s]

*Bシナリオ選択
[イベント絵表示 file = "【イベント】黒.BMP"]
[freeimage layer = 1]
@eval exp = "f.Bカウンタ += 1"
@jump storage = "B01.ks" cond = "f.Bカウンタ == 1"
@jump storage = "B02.ks" cond = "f.Bカウンタ == 2"
@jump storage = "B03.ks" cond = "f.Bカウンタ == 3"
@jump storage = "B04.ks" cond = "f.Bカウンタ == 4"
[s]

