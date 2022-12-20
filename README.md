# アプリケーション名
Wasurena (勿忘）

# アプリケーション概要
幼稚園や保育園バスの送迎時に乗車と降車、出席、欠席の管理ができる。

# URL
- https://wasurena.onrender.com

# テスト用アカウント
- Basic認証ID: 

- Basic認証PASS:

- テスト用アカウントメールアドレス:

- テスト用アカウントPASS:

# 利用方法
## グループの作成
## 児童の登録
## クラスの作成
## 送迎の作成
## 児童の編集
## 一覧ページでの動作



# アプリケーションを作成した背景
保育園の送迎バスで子供を降ろし忘れ、亡くなってしまうニュースをを見ました。自分も幼稚園にバスで通う子供を持っています。そこで、ニュースのような子供を降ろし忘れるような事故が起きないようなアプリを作れないかと考え、作成を致しました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1FX-DNpxTTG3r5xCpaIUpdusAWN-7D5571AEyMTwJDoI/edit#gid=982722306
# 実装した機能についての画像、Gifおよびその説明

# 実装予定の機能
- 児童詳細で、連絡事項などを忘れないようにメモできる機能
- 送迎の種類毎に時間を入れられるようにして児童をその順番に並べる機能
- 児童毎に設定するクラス、送迎種類をチェックボックスを使ってまとめて設定できるようにする
- 管理者と編集者や一般として使用できることを権限毎に与える

# データベース設計

<img src="table_design.png">

# 画面遷移図
<img src="flow_chart.png">

# 開発環境
- フロントエンド：HTML,CSS,Javascript
- バックエンド：Ruby
- インフラ
- テスト
- テキストエディタ
- タスク管理
  
# ローカルでの動作方法
以下コマンド実行
% git clone https://github.com/rrr-ryu/wasurena.git
% cd wasureana
% bundle install
% yarn install
% rails db:seed

# 工夫したポイント

