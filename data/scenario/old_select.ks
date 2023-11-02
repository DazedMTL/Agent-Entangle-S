;//
[gotostart]
[s]

;//インターミッション分岐
@if exp = "f.Aカウンタ >= 1 && f.Bカウンタ >= 1 && !f.インターミッション01"
@eval exp = "f.インターミッション01 = true"
@jump storage = "インターミッション01.ks"
@endif

@if exp = "f.Aカウンタ >= 2 && f.Bカウンタ >= 2 && !f.インターミッション02"
@eval exp = "f.インターミッション02 = true"
@jump storage = "インターミッション02.ks"
@endif

@if exp = "f.Aカウンタ >= 3 && f.Bカウンタ >= 3 && !f.インターミッション03"
@eval exp = "f.インターミッション03 = true"
@jump storage = "インターミッション03.ks"
@endif

[layopt layer = "message0" visible = "false"]
[フェードＯＦＦ]
[image storage = "行動選択背景.tlg" page = "fore" left = "0" top = "0" layer = "0" visible ="true"]
[mapaction storage = "シーンセレクト_マップ定義.ma" layer = "0" page = "fore"]
[mapimage storage = "シーンセレクト_マップ.png" layer = "0" page = "fore"]



[pimage storage = "行動選択A1.tlg" page = "fore" visible ="true"layer = "0" dx = "0" dy = "0" cond = "f.Aカウンタ == void"]
[pimage storage = "行動選択B1.tlg" page = "fore" visible ="true"layer = "0" dx = "0" dy = "0" cond = "f.Bカウンタ == void"]

;[if exp = "f.Aカウンタ !== void && f.Bカウンタ !== void"]

[pimage storage = "行動選択A2.tlg" page = "fore" visible ="true" layer = "0" dx = "0" dy = "0" cond = "f.Aカウンタ == 1"]
[pimage storage = "行動選択B2.tlg" page = "fore" visible ="true" layer = "0" dx = "0" dy = "0" cond = "f.Bカウンタ == 1"]

[pimage storage = "行動選択A3.tlg" layer = "0" dx = "0" dy = "0" cond = "f.Aカウンタ == 2"]
[pimage storage = "行動選択B3.tlg" layer = "0" dx = "0" dy = "0" cond = "f.Bカウンタ == 2"]

[pimage storage = "行動選択A4.tlg" layer = "0" dx = "0" dy = "0" cond = "f.Aカウンタ == 3"]
[pimage storage = "行動選択B4.tlg" layer = "0" dx = "0" dy = "0" cond = "f.Bカウンタ == 3"]

[endif]
[s]

*Aシナリオ選択
[freeimage layer = 1]

@eval exp = "f.Aカウンタ += 1"

@jump storage = "地上1.ks" cond = "f.Aカウンタ == 1"
@jump storage = "地上2.ks" cond = "f.Aカウンタ == 2"
@jump storage = "地上3.ks" cond = "f.Aカウンタ == 3"
@jump storage = "地上4.ks" cond = "f.Aカウンタ == 4"
[s]

*Bシナリオ選択
[freeimage layer = 1]

@eval exp = "f.Bカウンタ += 1"

@jump storage = "地下1.ks" cond = "f.Bカウンタ == 1"
@jump storage = "地下2.ks" cond = "f.Bカウンタ == 2"
@jump storage = "地下3.ks" cond = "f.Bカウンタ == 3"
@jump storage = "地下4.ks" cond = "f.Bカウンタ == 4"
[s]
