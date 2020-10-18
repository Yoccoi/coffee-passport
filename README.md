# 概要
コーヒーが好きな人のための記録用アプリケーションです。  
ユーザー登録をすると自分の購入したコーヒー豆に関する情報が記録できます。  
また、購入店舗を一緒に保存しておくことで他のユーザーにもおすすめが出来ます。

# URL
https://coffee-passport.herokuapp.com/

# テスト用アカウント

## テストアカウント
Email: test@test  
Password: 000000

## Basic認証
ID: admin  
Password: 2222

# 利用方法

## 記録方法
まずは、画面右上より新規ユーザー登録を行ってください。
登録後、トップページ画面中央の"RECORD"ボタンより記録ページへ遷移できます。
フォームに記入後、画面下の完了ボタンを押すことにより情報が記録・公開されます。

## 詳細情報閲覧
トップページ下部に記録されている情報が並んでいるので、気になる画像をクリックします。
＊遷移後、地図が表示されない場合、リロードを行ってください。

## ユーザー編集
画面右上のユーザー名をクリックすると、遷移先からユーザー名の変更が行なえます。

# 目指した課題解決
コーヒーが好きな人にとってコーヒー豆を選ぶことは楽しみです。
行きつけのお店はもちろんのこと、新しいお店での偶然の出会いも日常を彩ってくれます。
ただし、プロフェッショナルでテイスティングノートを日頃から付けるような人でなければ、
コーヒー豆の美味しさを細かく記録することは難しいです。
どのような苦味で、どのような香りで、どのような気分になったのか。
誰でも気軽に記録ができ、また他のユーザーの記録から新しいお店が発見できる。
コーヒー好きな人に寄り添うアプリケーションを目指しました。

# 洗い出した用件
- レーティング機能
- 記録詳細機能
- マイページ機能
- 購入店舗情報の記載

# 実装した機能についてのGIFと説明
- 星による簡単な評価機能  
[![Image from Gyazo](https://i.gyazo.com/31f1a672008243b253bba49754dc6a55.gif)](https://gyazo.com/31f1a672008243b253bba49754dc6a55)

- 視覚的に分かりやすいグラフ表記
[![Image from Gyazo](https://i.gyazo.com/7281ca4194a86fff29f3c676b1848c74.gif)](https://gyazo.com/7281ca4194a86fff29f3c676b1848c74)

- 地図による購入店舗情報の表示
[![Image from Gyazo](https://i.gyazo.com/80072e6e907b3630e3f0d90c622da994.gif)](https://gyazo.com/80072e6e907b3630e3f0d90c622da994)

# 実装予定の機能
- エラーメッセージの日本語表記
- フォロー機能

# データベース設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| birthday       | date    | null: false |

### Association

- has_many :notes

## notes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| rating                 | float      | null: false                    |
| comment                | text       |                                |
| bitter                 | float      |                                |
| acidity                | float      |                                |
| aroma                  | float      |                                |
| body                   | float      |                                |
| roast_date             | date       |                                |
| grams                  | integer    |                                |
| price                  | integer    |                                |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shop

## shops テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| purchase_date   | string     |                                |
| location        | string     |                                |
| note_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :note

# ローカルでの動作方法

## Git clone方法

```
% git clone https://github.com/Yoccoi/coffee-passport.git
% cd coffee-passport
% bundle install
% yarn install
% rails db:create
% rails db:migrate
```

## 開発環境
- Ruby: ruby 2.6.5
- Ruby on Rails: Rails 6.0.3.3