*First
;//定数////////////////////////////////////////////////////

@iscript
tf.EventGraphicLayerNo = 'base';//メインCGのレイヤーナンバー

tf.MainDisplayGraphicLayerNo = 'base';//メイン画面枠CGのレイヤーナンバー
tf.BackgroundGraphicLayerNo = 0;//背景CGのレイヤーナンバー
tf.CharacterGraphicLayerNo = 1;//人物
tf.CutGraphicLayerNo = 2;//カットイン
tf.EffectGraphicLayerNo = 3;//エフェクトCGのレイヤーナンバー

tf.VoiceBufNo = 0;//音声のバッファナンバー変数
tf.BGMBufNo = 1;//BGMのバッファナンバー変数
tf.SEBufNo = 2;//効果音のバッファナンバー変数
tf.SE2BufNo = 3;//環境音のバッファナンバー変数

@endscript

;//画面レイヤー数設定
@laycount layers = "4"



;//マクロ等プラグイン読み出し//////////////////////////////
;//OGG再生プラグイン

;//gvolumeプラグイン適用前に音量を調整することでgvolumeの初期音量を指定できる
[if exp="sf.初回音量調整 != 1"]
	[seopt buf="0" gvolume="70"]
	[seopt buf="1" gvolume="50"]
	[seopt buf="2" gvolume="50"]
	[seopt buf="3" gvolume="50"]
	[eval exp="sf.初回音量調整 = 1"]
[endif]


[seopt buf="0" volume="100"]
[seopt buf="1" volume="40"]
[seopt buf="2" volume="40"]
[seopt buf="3" volume="40"]

@loadplugin module=wuvorbis.dll
;//音量調節プラグイン
@call storage=gvolume.ks
@gvolmenu name="声(&V)" control="&tf.VoiceBufNo"
@gvolmenu name="音楽(&B)" control="&tf.BGMBufNo"
@gvolmenu name="効果音(&E)" control="&tf.SEBufNo"
@gvolmenu name="環境音(&B)" control="&tf.SE2BufNo"

;//どこでもセーブプラグイン
@call storage="autoInsertLabel.ks"

;//各種統合タグ
@call storage="macros.ks"
;↓基本画像拡大縮小率/変更すると拡大率を変更できる
[eval exp="tf.拡大縮小率=100"]
@call storage="バンデジネ.ks"
@call storage="画像登録.ks"
;//初期設定///////////////////////////////////////////////
*start|セーブファイル
;//最初に戻る地点
@startanchor

*from_badend
[stopquake]
[stopse buf = "0"]
[stopse buf = "1"]
[stopse buf = "2"]
[stopse buf = "3"]

[eval exp = "kag.clickCount = 0"]
[eval exp = "kag.skipMode = 0"]

[stopvideo slot = "0"]
[clearvideolayer slot = "0" channel = "1"]

[AllFreeimageBack]
[AllFreeimageFore]

;//ゲームオーバーやエンド後、最初に戻るで戻ってくると変数が残るので
;//ゲーム変数を初期化
@clearvar
;//同じ理由で回想シーン判定変数削除



@iscript
delete tf.回想モード中;
delete tf.ＣＧモード中;
@endscript

;//メッセージレイヤーOFF 右クリックOFF メッセージ履歴OFF セーブOFF

[layopt layer = "message1" visible = "false"]
[layopt layer = "message0" visible = "false"]
[rclick enabled=false]
[history output=false enabled=false]
[disablestore]



;//ロゴ、タイトル表示/////////////////////////////////////
[wait time=1000]

[backlay]
[AllFreeimageBack]
[image storage = "サークルロゴ" page = "back" layer = "base"]
[trans method = crossfade time = 1000]
[wt]
[stoptrans]

[wait time=1000]

[backlay]
[AllFreeimageBack]
[trans method = crossfade time = 1000]
[wt]
[stoptrans]

[wait time=500]


;//メニュー////////////////////////////////////////////
*menu_top
[stoptrans]
[backlay]
[AllFreeimageBack]
[image storage="【タイトル画面】ベース.BMP" page=back layer=base]

[trans method = crossfade time = 750]
[wt]

;;体験版時の全体クリック待ち
;[waitclick]
;//右クリックON
;[rclick enabled=true]
;//メッセージ履歴ON
;[history output=true enabled=true]
;[jump target="*menu_1"]

[s]


*menu_1
[音楽ストップ]
*セーブ開始
;//右クリックON
[rclick enabled=true]
;//メッセージ履歴ON
[history output=true enabled=true]

[jump storage = "00.ks"]
[s]


*menu_2
[jump storage = "ギャラリー.ks" target = "*CG_gallery"]
[s]

*menu_3
[jump storage = "ギャラリー.ks" target = "*RP_gallery"]
[s]

*menu_4
[close]
[jump target = "*menu_top"]
[s]





*db
[イベント絵表示 time = "0" file = "【イベント】黒.tlg"]

[nowait]
Choose a message window to use for testing
[link target="*イベント"]For events[endlink]｜[link target="*通常"]For normal use[endlink]
[endnowait]
[s]

*通常
[nowait]
[MainMessageWindow page="fore"]
[cm]
[jump target="*メニュー"]
[s]

*イベント
[EventMessageWindow page="fore"]
[cm]
[jump target="*メニュー"]
[s]

*メニュー

[nowait]
[link target="*全タグテスト"]Full tag test[endlink]
linkstorage=Gallery. kstarget=*CG_galleryCG modeendlink | linkstorage=Gallery.[r]kstarget=*RP_galleryReminiscence modeendlink[r]linktarget=*All_flashback_flag_onAll flashback flag onendlink |[r]linktarget=*All_flashback_flag_offAll flashback flag offendlink[pcm]


linkstorage=01_Opening. ks01_Openingendlink | linkstorage=Intermission01.[l][er]
ksIntermission 01endlink linkstorage=Intermission02.[l][er]
ksIntermission 02endlink | linkstorage=Intermission03.[l][er]
ksIntermission 03endlink linkstorage=underground1.[l][er]
ksunderground 1endlink | linkstorage=underground2.[l][er]
ksunderground 2endlink linkstorage=underground3.[l][er]
ksunderground 3endlink | linkstorage=underground4.[pcm]

ksunderground 4endlink[pcm]
linkstorage=Underground4BE_Route.[l][er]
ksUnderground 4BE Routeendlink | linkstorage=Underground4GE_Route.[l][er]
ksUnderground 4GE Routeendlink linkstorage=Underground4_Erotic_Scene.[l][er]
ksUnderground 4 Erotic Sceneendlink | linkstorage=Underground5.[l][er]
ksUnderground 5endlink linkstorage=Underground5_Erotic_Scene.[l][er]
ksUnderground 5 Erotic Sceneendlink | linkstorage=Underground6_BE.[l][er]
ksUnderground 6_BEendlink linkstorage=Underground6_GE.[l][er]
ksUnderground 6_GEendlink | linkstorage=AboveGround1.[pcm]

ksAbove Ground 1endlink[pcm]
linkstorage=AboveGround2. ksAbove Ground 2endlink | linkstorage=AboveGround3.[l][er]
ksAbove Ground 3endlink linkstorage=AboveGround4.[l][er]
ksAbove Ground 4endlink | linkstorage=AboveGround4BE_Route.[l][er]
ksAbove Ground 4BE Routeendlink linkstorage=AboveGround4GE_Route.[l][er]
ksAbove Ground 4GE Routeendlink | linkstorage=AboveGround4_Erotic_Scene.[l][er]
ks4 erotic scenes on the groundendlink linkstorage=AboveGround5.[l][er]
ksAbove Ground 5endlink | linkstorage=AboveGround5_Erotic_Scene.[pcm]

ks5 erotic scenes on the groundendlink[pcm]
linkstorage=AboveGround6_BE. ksAbove Ground[r]6_BEendlink｜linkstorage=AboveGround6_GE.[l][er]
ksAbove Ground 6_GEendlink linkstorage=Common_Ending_AboveGround_Underground.[pcm]

Above Ground and Underground Common Ending[pcm]
[endnowait]
[s]







*全タグテスト
[cm]
background test
[会話シーン file = "【背景】テラス.tlg"][p]
[会話シーン file = "【背景】テラス夕方.tlg"][p]
[会話シーン file = "【背景】ベースキャンプ.tlg"][p]
[会話シーン file = "【背景】ベースキャンプ2.tlg"][p]
[会話シーン file = "【背景】ベースキャンプ3.tlg"][p]
[会話シーン file = "【背景】一階フロア崩落前.tlg"][p]
[会話シーン file = "【背景】一階フロア崩落後.tlg"][p]
[会話シーン file = "【背景】二階フロア.tlg"][p]
[会話シーン file = "【背景】回廊.tlg"][p]
[会話シーン file = "【背景】回廊中間点.tlg"][p]
[会話シーン file = "【背景】地下螺旋階段.tlg"][p]
[会話シーン file = "【背景】地底石扉.tlg"][p]
[会話シーン file = "【背景】地底祭壇.tlg"][p]
[会話シーン file = "【背景】獣道.tlg"][p]
[会話シーン file = "【背景】祭壇への通路.tlg"][p]
[会話シーン file = "【背景】遺跡外観.tlg"][p]
[会話シーン file = "炎天3.tlg"][p]
[会話シーン file = "白_800-600.tlg"][p]
[会話シーン file = "赤_800-600.tlg"][p]
[会話シーン file = "青_800-600.tlg"][p]
[会話シーン file = "黒_640-480.tlg"][p]
[会話シーン file = "黒_800-600.tlg"][p]



[cm]
Standing picture
[人物 file = "【立ち絵】アカリ_こんなもんよ.tlg"][p]
[人物 file = "【立ち絵】アカリ_やったね.tlg"][p]
[人物 file = "【立ち絵】アカリ_ダメージ軽.tlg"][p]
[人物 file = "【立ち絵】アカリ_ダメージ重.tlg"][p]
[人物 file = "【立ち絵】アカリ_不機嫌.tlg"][p]
[人物 file = "【立ち絵】アカリ_伏目.tlg"][p]
[人物 file = "【立ち絵】アカリ_呆れ.tlg"][p]
[人物 file = "【立ち絵】アカリ_哀しみ.tlg"][p]
[人物 file = "【立ち絵】アカリ_喜び.tlg"][p]
[人物 file = "【立ち絵】アカリ_怒り.tlg"][p]
[人物 file = "【立ち絵】アカリ_悪巧み.tlg"][p]
[人物 file = "【立ち絵】アカリ_慎重.tlg"][p]
[人物 file = "【立ち絵】アカリ_普通.tlg"][p]
[人物 file = "【立ち絵】アカリ_暴力行為.tlg"][p]
[人物 file = "【立ち絵】アカリ_説教.tlg"][p]
[人物 file = "【立ち絵】アカリ_説教強.tlg"][p]
[人物 file = "【立ち絵】アカリ_警戒.tlg"][p]
[人物 file = "【立ち絵】アカリ_驚き.tlg"][p]
[人物 file = "【立ち絵】アカリ_驚きギャグ.tlg"][p]
[人物 file = "【立ち絵】アカリ事後A_1.tlg"][p]
[人物 file = "【立ち絵】アカリ事後A_2.tlg"][p]
[人物 file = "【立ち絵】アカリ事後A_3.tlg"][p]
[人物 file = "【立ち絵】アカリ事後B_1.tlg"][p]
[人物 file = "【立ち絵】アカリ事後B_2.tlg"][p]
[人物 file = "【立ち絵】アカリ事後B_3.tlg"][p]
[人物 file = "【立ち絵】アカリ後姿_ぐっ.tlg"][p]
[人物 file = "【立ち絵】アカリ後姿_不機嫌.tlg"][p]
[人物 file = "【立ち絵】アカリ後姿_困る.tlg"][p]
[人物 file = "【立ち絵】アカリ後姿_怒り.tlg"][p]
[人物 file = "【立ち絵】アカリ後姿_指差し.tlg"][p]
[人物 file = "【立ち絵】アカリ後姿_驚き.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿P無_哀.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿P無_喜.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿P無_怒.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿P無_普通.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿P無_楽.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿_哀.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿_喜.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿_怒.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿_普通.tlg"][p]
[人物 file = "【立ち絵】ファニタ下着姿_楽.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着_哀.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着_喜.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着_怒.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着_普通.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着_楽.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着帽子無し_哀.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着帽子無し_喜.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着帽子無し_怒.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着帽子無し_普通.tlg"][p]
[人物 file = "【立ち絵】ファニタ普段着帽子無し_楽.tlg"][p]
[人物 file = "【立ち絵】暴走男1.tlg"][p]
[人物 file = "【立ち絵】暴走男2.tlg"][p]
[人物 file = "【立ち絵】暴走男3.tlg"][p]
[人物 file = "【立ち絵】暴走男4.tlg"][p]
[人物 file = "【立ち絵】暴走男5.tlg"][p]
[人物 file = "【立ち絵】暴走男6.tlg"][p]
[人物 file = "【立ち絵】煌璃_お疲れ.tlg"][p]
[人物 file = "【立ち絵】煌璃_にぱっ.tlg"][p]
[人物 file = "【立ち絵】煌璃_怒り.tlg"][p]
[人物 file = "【立ち絵】煌璃_普通.tlg"][p]
[人物 file = "【立ち絵】煌璃_焦り.tlg"][p]
[人物 file = "【立ち絵】煌璃白衣_お疲れ.tlg"][p]
[人物 file = "【立ち絵】煌璃白衣_にぱっ.tlg"][p]
[人物 file = "【立ち絵】煌璃白衣_怒り.tlg"][p]
[人物 file = "【立ち絵】煌璃白衣_普通.tlg"][p]
[人物 file = "【立ち絵】煌璃白衣_焦り.tlg"][p]
[人物 file = "【立ち絵】異形.tlg"][p]
[人物 file = "【立ち絵】異形シルエット.tlg"][p]
[人物 file = "【立ち絵】竜もどき.tlg"][p]

[人物消去]

[cm]
Cut-in test
[カットイン file = "【カットイン】アカリ発砲.tlg"][p]
[カットイン file = "【カットイン】カンテラ.tlg"][p]
[カットイン file = "【カットイン】コンビーフ.tlg"][p]
[カットイン file = "【カットイン】サバ缶.tlg"][p]
[カットイン file = "【カットイン】マッピング.tlg"][p]
[カットイン file = "【カットイン】リュックザック.tlg"][p]
[カットイン file = "【カットイン】事後掻き出し.tlg"][p]
[カットイン file = "【カットイン】事後服アリ.tlg"][p]
[カットイン file = "【カットイン】事後服ナシ.tlg"][p]
[カットイン file = "【カットイン】使い古した手帳.tlg"][p]
[カットイン file = "【カットイン】卵.tlg"][p]
[カットイン file = "【カットイン】宝玉2.tlg"][p]
[カットイン file = "【カットイン】宝玉光.tlg"][p]
[カットイン file = "【カットイン】岩による一撃.tlg"][p]
[カットイン file = "【カットイン】手榴弾.tlg"][p]
[カットイン file = "【カットイン】暴走する男.tlg"][p]
[カットイン file = "【カットイン】松明.tlg"][p]
[カットイン file = "【カットイン】松明点火前.tlg"][p]
[カットイン file = "【カットイン】煌璃キック.tlg"][p]
[カットイン file = "【カットイン】穂先.tlg"][p]
[カットイン file = "【カットイン】触手から伸びる針.tlg"][p]
[カットイン file = "【カットイン】預金通帳.tlg"][p]
[カットイン file = "【カットイン】飛び散る瓦礫.tlg"][p]
[カットイン file = "【カットイン】食べれる果物.tlg"][p]
[カットイン消去][p]



[cm]
event picture test
[イベント絵表示 file = "【イベント】白.tlg"][p]
[イベント絵表示 file = "【イベント】黒.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_2_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_2_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_1_1d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_1_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_2_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_3_2_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_1_2c.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_1_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_4.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_4d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_5.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_5d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_6.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_7.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_7d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_8.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_4_2_9.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_4.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_5.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_5c.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_5d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_6.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_1_6d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_4.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_4d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_5.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_5d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_6.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_7.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_7d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_8.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_5_2_8d.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_6_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】A_6_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_1_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_2_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_2_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_1_1c.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_1_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_1d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_2d2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_3_2_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_1_3d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_1d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_4.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_5.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_5d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_6.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_4_2_6d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_1d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_2d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_4.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_4d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_5.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_5d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_6.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_1_6d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_3.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_4.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_4d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_5.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_5d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_6.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_6d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_7.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_7d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_8.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_5_2_8d.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_6_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】B_6_2.tlg"][p]
[イベント絵表示 file = "【エロシーン】I2_1.tlg"][p]
[イベント絵表示 file = "【エロシーン】I2_2.tlg"][p]

[イベント絵表示 file = "黒_800-600.tlg"][p]

Event picture zero seconds display
[イベント絵表示 time="0" file = "【エロシーン】B_5_2_8.tlg"][p]

*bgmテスト
[pcm]
music test
[音楽 file = "5.解放.ogg"][p]
[音楽 file = "6.変異.ogg"][p]
[音楽 file = "7.混沌.ogg"][p]
[音楽 file = "Tideline walking.ogg"][p]
[音楽 file = "【BGM】切迫する状況.ogg"][p]
[音楽 file = "【BGM】戦闘状況.ogg"][p]
[音楽 file = "【BGM】狂気の芽生え.ogg"][p]
[音楽 file = "【BGM】迫る恐怖.ogg"][p]
[音楽 file = "アカリのテーマ Full.ogg"][p]
[音楽 file = "ピンチ.ogg"][p]
[音楽 file = "不穏.ogg"][p]
[音楽 file = "地に伏し、蛇の如く.ogg"][p]
[音楽 file = "戦闘.ogg"][p]
[音楽 file = "探索.ogg"][p]
[音楽 file = "教授.ogg"][p]
[音楽 file = "纏炎のケルベイム.ogg"][p]
[音楽 file = "迷い猫の行進.ogg"][p]

[音楽フェードアウト time = "1000"]music fade out[p]
stop
[音楽ストップ]
[p][cm]

[効果音 file = "【効果音】くちゅくちゅ_ピストン_早.ogg"][p]
[効果音 file = "【効果音】ぐちゅぐちゅ.ogg"][p]
[効果音 file = "【効果音】ぐちゅぐちゅ_ピストン.ogg"][p]
[効果音 file = "【効果音】じゅっじゅっ_早.ogg"][p]
[効果音 file = "【効果音】倒れる.ogg"][p]
[効果音 file = "【効果音】叩き付ける.ogg"][p]
[効果音 file = "【効果音】打撃軽.ogg"][p]
[効果音 file = "【効果音】打撃重.ogg"][p]
[効果音 file = "【効果音】拳銃.ogg"][p]
[効果音 file = "【効果音】水中.ogg"][p]
[効果音 file = "【効果音】潮騒.ogg"][p]
[効果音 file = "【効果音】爆発大.ogg"][p]
[効果音 file = "【効果音】爆発小.ogg"][p]
[効果音 file = "【効果音】風.ogg"][p]

[効果音フェードアウト time = "1000"]sound effect fade out[p]
stop
[効果音ストップ]

[cm]
Shake check
[弱_横揺れ][p]
[弱_縦揺れ][p]
[弱_全体揺れ][p]

[強_横揺れ][p]
[強_縦揺れ][p]
[強_全体揺れ]

[揺れ待機]

[cm]
flash check
[フラッシュ type = "白"][p]
[フラッシュ type = "赤"][p]
[フラッシュ type = "黒"][p]
[フラッシュ type = "青"][p]

[フェードＯＮ type = "白" time = ""][p]
[フェードＯＮ type = "赤" time = ""][p]
[フェードＯＮ type = "黒" time = ""][p]
[フェードＯＮ type = "青" time = ""][p]

[フェードＯＮ type = "白"][p]

[フェードＯＦＦ time = "1000"][p]

[フェードＯＦＦ][p]

[cm]
end
[jump target="*db"]


*全回想フラグオン

[eval exp = "sf.CG_01 = 1"]
[eval exp = "sf.CG_02 = 1"]
[eval exp = "sf.CG_03 = 1"]
[eval exp = "sf.CG_04 = 1"]
[eval exp = "sf.CG_05 = 1"]
[eval exp = "sf.CG_06 = 1"]
[eval exp = "sf.CG_07 = 1"]
[eval exp = "sf.CG_08 = 1"]
[eval exp = "sf.CG_09 = 1"]
[eval exp = "sf.CG_10 = 1"]
[eval exp = "sf.CG_11 = 1"]
[eval exp = "sf.CG_12 = 1"]
[eval exp = "sf.CG_13 = 1"]
[eval exp = "sf.CG_14 = 1"]
[eval exp = "sf.CG_15 = 1"]
[eval exp = "sf.CG_16 = 1"]
[eval exp = "sf.CG_17 = 1"]
[eval exp = "sf.CG_18 = 1"]
[eval exp = "sf.CG_19 = 1"]
[eval exp = "sf.RP_01 = 1"]
[eval exp = "sf.RP_02 = 1"]
[eval exp = "sf.RP_03 = 1"]
[eval exp = "sf.RP_04 = 1"]
[eval exp = "sf.RP_05 = 1"]
[eval exp = "sf.RP_06 = 1"]
[eval exp = "sf.RP_07 = 1"]
[eval exp = "sf.RP_08 = 1"]
[eval exp = "sf.RP_09 = 1"]
[eval exp = "sf.RP_10 = 1"]
[eval exp = "sf.RP_11 = 1"]
[eval exp = "sf.RP_12 = 1"]
[jump target="*db"]

*全回想フラグオフ
[clearsysvar]
[jump target="*db"]
[s]

*終了
[close]

[jump target = "*menu_top"][s]
