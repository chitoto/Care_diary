# README

## 介護記録共有アプリ Care_diary

### 概要___
このアプリは大切なペットたちの毎日の介護記録を保存できます。
家族等、グループ間での記録の共有ができます。

###コンセプト___
介護の大変さを和らげる

### バージョン___
- Ruby 2.6.5
- Ruby on Rails 5.2.4
- PostgreSQL 13.0

### 機能一覧___
**アカウント作成機能** 重要度：高
- ユーザーの登録/編集/削除機能
- ログイン機能
- SNSログイン機能
**日別 介護記録作成機能** 重要度：高
- ペットの情報作成
  - ペット名、プロフィールを登録できる
- 日別の介護記録を作成・保存
  - 日付別に体調管理記録が記述できる
  - 日付別に記録の一覧を表示
- 記録の編集・削除機能
  - 編集と削除は投稿者のみ実行可能
- 記録の詳細を閲覧できる
  - 記録を作成・閲覧できるのは作成者かPetの属するグループのユーザー
- 注意事項表示作成機能
  - 日別記録画面で注意事項など確認できる
- カテゴリー別作成機能
- 食事情報・身体測定・排泄情報など別で管理できる
**日別 グループ機能** 重要度：高
- グループの作成
  - ユーザーと家族間などでのグループを作成できる
- グループに属するユーザーの追加機能
  - 介護記録を共有したい者をグループに追加する
- グループの管理者を設定できる
  - 管理者のみ属するユーザーを削除できる
- グループ間でコメントの投稿/編集/削除機能
  - コメント編集とコメント削除はコメントした本人のみ可能
  - コメント機能はページ遷移なしで実行できる
**その他要件機能** 重要度：高
- herokuかAWSへアップロード
- 辞書機能
- エラーページの実装
- seedデータ(最低20件)
- RSpec
___
**整頓されたUI** 重要度：中
- 登録のフローチャート表示
  - 登録から記録投稿するまでの流れをわかりやすくする
- 日別の介護記録をカレンダーで表示
  -UI向上、Gem simple_calendar または FullCalendar
- 体重などグラフを用いて表示
  - Gem chartkick
- 入力ワンクリックで入力できるようにする
  - 入力をアイコンやselect式、履歴で入力できる
**便利機能** 重要度：中
- 記録をPDF化する機能
  - 記録をまとめてPDF化できることで、手元に保存しやすく、紙媒体(アルバムなど)にもできるようになる
- コメントをメール送信機能
  - 選択したコメントをメールでグループに一斉送信できる機能(大事な情報は即座に共有)
  ___
**管理者権限** 重要度：低
- 管理者を作成することができる
  - 全てのデータの作成、編集、削除ができる
- 管理者画面を作成
  - ユーザーの一覧、編集、削除ができる
  - 企業情報の作成ができる
**介護企業情報を登録** 重要度：低
- 介護企業情報が登録できる
  - 企業情報に地図 google map API
- 企業の従業員アカウントが登録できる
  - staffもグループに参加でき、情報を共有できる(作成、閲覧制限あり)
**企業情報を閲覧機能** 重要度：低
- ユーザーに介護に対応できる企業の情報を閲覧できる
  - 企業の業種(トリマー、シッター、物販など)で検索できる Gem ransack
  - 企業のお気に入り登録ができる
  - 企業を評価すること、評価コメントを見ることができる
**情報投稿機能** 重要度：低
- ユーザー、staffが役立つ情報、疑問を投稿できる
  - コメントを投稿できる
___
### 課題要件___
#### カリキュラム内の技術2つ
- devise
- コメント機能
#### カリキュラム外の技術１つ
- SNSログイン

### カタログ設計___
https://docs.google.com/spreadsheets/d/1VN4TUUtaxoDlsHDO_mTb35kCe8r-iUgk_gl4wwA2hIY/edit?usp=sharing

### 機能一覧___
https://docs.google.com/spreadsheets/d/1r4ORFqm0TPI60ZcfFwpZpNGLoic7DmoMvqAbAnBrjog/edit?usp=sharing

### テーブル定義___
https://docs.google.com/spreadsheets/d/11ClpPAXqi4d9Kvego3cwrdv59cRk7P_L14Ex_Xh31Uw/edit?usp=sharing

### ER図___
https://docs.google.com/spreadsheets/d/1mLR2U8Y0k5jwtWZyNa1bj5FpBnbOJNIs3TZMA7B4dNM/edit?usp=sharing

### 画面遷移図___
https://docs.google.com/spreadsheets/d/1wnIoIsZRbb5nex3cg7XPfNdKF2QgA51RteiQxNCEjXY/edit?usp=sharing

### ワイヤーフレーム___
https://docs.google.com/spreadsheets/d/1XP3-ehSTh8yCo7O6BzRgsrcJOxldlo3G7CcN3EuaNFM/edit?usp=sharing

### 使用予定gem___
- carrierwave
- mini_magick
- devise
- ransack
- chartkick
- simple_calendar
