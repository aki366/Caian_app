# Caian
## Caianとは、若手リーダーのマネージメントをサポートする実績評価と課題管理が一つになったサービスです。
※現在開発中の為、サービスを公開しておりません。

## サービス概要
1.  課題管理
- 日々のちょっとした業務改善から、チームの課題について共有、管理が可能です。
- ボスはメンバーから提案された投稿に『GO』か『STOP』のリアクションで素早く意思を伝えることができます。
- コメントを添えてフィードバックすることも可能です。
2.  実績評価
- メンバーが投稿した実績は自動で数値化、グラフ化されいつでも最新の実績を把握することができます。
- ボスはメンバーの提案に対してその場で５段階の評価を付け、いつでも見返すことができます。
- メンバーごとの実績をマージしてチームの強みと弱みを視覚的に把握できます。
3.  SNS機能
- メンバー同士でメッセージを交換することも可能です。
- 提案された投稿やコメントにメンバー同士で自由に『いいね！』を付けることができます。

## サービス開始の流れ
* ユーザー登録のみ、簡単1ステップ
  - あなたは所属するチームのボスから招待をもらいメンバーになるだけ。
  - あなたがボスとなって、自由にチームを作りメンバーを招待することも可能です。
  - 役職や細かい権限の設定は不要。ボスかメンバーただそれだけです。

## 制作背景
前職でリーダーを経験した際に、メンバーが行った改善活動や問題提起のアウトプット方法が様々で評価する際の数値化などに手間が掛っていました。そのため、せっかくの提案も実績として抜けていたり、透明性が無かったりという経験をしました。
そういった背景から、もっと手軽に適切に、管理、評価できるサービスを提供できないかと考えこのサービスを開発しました。

## 使用技術
* フロントエンド
  - HTML/CSS
  - JavaScript
  - chart.js(第2段階で実装予定)
  - Vue.js(第3段階で実装予定)
  - Vuetify(第3段階で実装予定)
  - Nuxt.js(+αで実装予定)

* バックエンド
  - Ruby 3.0.3
  - Ruby on Rails 6.1.4.3
  - MySQL 8.0.27
  
* インフラ
  - Heroku
  - Nginx/Puma（将来の大量同時アクセスを想定）
  - AWS(VPC/EC2/RDS/ALB/S3/ACM/Route53/ECS)(第3段階で実装予定)
  - ECS（Fargate）(第3段階で実装予定)

* テスト
  - RSpec
  - Jest

* 解析ツール
  - RuboCop（第１段階）

* CI/CD
  - CircleCI
  - Capistrano

* バージョン管理
  - Git/GitHub

* 開発環境
  - VScode
  - Docker/docker-compose
 
## インフラ構成図

## ER図
![figure of ER](app/assets/images/ER図.png)

## 画面遷移図
![figure of ER](app/assets/images/画面遷移図.png)

## 機能一覧

* ユーザー(Users)
  - ユーザー新規登録/編集/削除
  - ユーザーアイコン登録/編集/削除
  - ログイン/ログアウト/ゲストログイン
  - パスワード再設定

* 課題投稿(Posts)
  - 投稿/編集/削除
  - 一覧表示、詳細表示
  - 画像複数登録
  - 投稿日時表示
  - 投稿者
  - ステータス
  - カテゴリ
  - 件名
  - 課題内容
  - 対策案
  - いいね
  - 課題投稿とコメントを同一画面で表示
  - 課題内容の表示（トップ画面に簡易表示、一覧表示、詳細表示、ソート機能）

* 課題投稿へのコメント(Comments)
  - 投稿/編集/削除
  - 投稿日時表示
  - コメント

* 実績のグラフ化(   s)
  - 投稿数
  - 対策数
  - 完了数
  - イイね数
  - ユーザ一覧で実績表示

* ランキング機能(   s)
 - 全体
 - グループ
 - 期間のソート

* カテゴリ一覧(   s)
  - トップ画面にカテゴリ一覧の表示、検索機能に応用

* その他
  - 検索機能
  - レスポンシブデザイン
  ＜以下余裕があれば実装＞
  - リマインダー機能
  - 通知機能（投稿、更新）