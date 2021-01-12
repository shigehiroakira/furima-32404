 
# フリーマーケットアプリケーション
 
## アプリケーションの概要
出品者が 

***URL***
 

 
## テスト用アカウント

ログイン　
パスワード

購入者メールアドレス
購入者パスワード

出品者メールアドレス
購入者パスワード

 
## 利用方法（説明）
 
 
## 目指した課題解決
 

 
## 要件定義
 

 
## 実装した機能について
 

## 実装予定の機能

 
## データベース設計
 
 ER図を添付
 
## ローカルでの作業方法
git clone https://github.com/YYYYYY/XXXXX.git

### 自分用にローカルにgitリポジトリをつくる
git init
git add *
git commit -m "initial import"

### 変更のコミット
git commit -a -m "<comment>"

### 変更したファイルのコミット
git add --all <target>






## Userテーブル

|Column                      |Type     |Options                   |
|----------------------------|---------|------------------------- |
| nickname                   | string  | null: false              |
| email                     | string  | unique: true, null: false |
| encrypted_password         | string  | null: false              |
| family_name                | string  | null: false              |
| first_name                 | string  | null: false              |
| family_name_kana           | string  | null: false              |
| first_name_kana            | string  | null: false              |
| birthday                   | date    | null: false              |



### Association
has_many   :items
has_many :purchuses


## Itemテーブル

|Column            |Type        |Options           |
|------------------|------------|------------------|
| name             | string     | null: false      |
| price            | integer    | null: false      |
| description      | text       | null: false      | 
| status_id        | integer    | null: false      |
| shipping_cost_id | integer    | null: false      |
| shipping_day_id  | integer    | null: false      |
| prefecture_id    | integer    | null: false      |
| category_id      | integer    | null: false      |
| user             | references | foreign_key: true|




### Association
belongs_to :user
has_one    :purchase




## Purchaseテーブル

|Column            |Type        |Options           |
|------------------|------------|------------------|
| user             | references | foreign_key; true|
| item             | references | foreign_key; true|


### Association
belongs_to :user
belongs_to :item
has_one    :address


## Addressテーブル

|Column        |Type        |Options           |
|--------------|------------|------------------|
| post_code    |string      | null: false      |
| prefecture_id|integer     | null: false      |
| city         |string      | null: false      |
| address      |string      | null: false      |
| building_name|string      |                  |
| phone_number |string      | null: false      |
| purchase     | references | foreign_key; true|



### Association
belongs_to :purchase


