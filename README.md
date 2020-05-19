# Teaser Screen
![teaser](images/teaser.gif)

オンラインイベント等で頻繁に利用する待機画像を生成するためのアプリケーション．
  * シンプル
  * CPUリソースの消費をなるべく抑える
  * テキスト入力と時計機能を備える
  * 背景エフェクトの切り替え機能
  * 自分でエフェクトを追加できる

を設計指針として制作しています。

# How to Contribute
上記の設計指針を参考に．effectを追加する場合は別途新規タブでeffectクラスを作成した後，TeaserScreen.pdeでsetup関数での初期化と，draw()関数内でのswitch分の追加を行い、動作確認をしてください。pull requestは作成したエフェクトファイルのみをリクエストしてください。利用しやすいようにtemplate.pdeというファイルを作成しておきました。こちらのクラス名及びファイル名を変更する形でコーディングするとやりやすいと思います。


# 実行
実行にはProcessing(>3.0)が必要になります。Processingで TeaserScreen.pdeを開いて実行してください。

# 使い方
  * F1：イベント開始1分前等にご利用ください。（It's about to startと表示されます）
  * F10: エフェクト一覧を表示し、クリックして選択できます。
  * 矢印キー（下、右）：次のエフェクトに変更します
  * 矢印キー（上、左）：前のエフェクトに変更します。
  * その他キーボード入力：テキスト（日本語不可）を表示することができます。

# Contributor
  * Box Effect: by [TaiyoYamaguchi](https://github.com/TaiyoYamaguchi)
  * Bubble Effect: by [00Enact](https://github.com/00Enact/TeaserScreen)
  * Starry Sky Effect: by [HarunaKurahashi](https://github.com/Haruna-Kurahashi)