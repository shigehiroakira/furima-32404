 
# フリーマーケットアプリケーション
 
## アプリケーションの概要
出品者が売りたい商品に値段などを付けて出品でき、購入者はサイトを訪れた際に購入したいものがあればクレジットカードを利用してネット上で決済が可能なアプリケーションです。

***URL***
https://furima-32404.herokuapp.com/

 
## テスト用アカウント

Basic認証ID  admin  
Basic認証pass 2222

購入者メールアドレス d@d  
購入者パスワード    akira22

出品者メールアドレス test@test  
購入者パスワード    akira11

 
## 利用方法（説明）
 出品者も購入者も必ずログインが必要です。
 出品者はログイン後にURL(https://furima-32404.herokuapp.com/items/new)にアクセスすると出品が可能です。
 その際に商品の画像や商品の説明、値段など９項目を全て入力することで出品が可能です。
 
 購入者は、トップページから出品された商品をご覧になれます。
 購入したい商品があれば画像や商品名をクリックすることで商品の詳細ページにアクセスができます。
 詳細ページから購入画面にアクセスしていただくとクレジットカード情報と配送先などの９項目を入力することで商品の購入が可能です。
 
 
## 目指した課題解決
 買い物が好きな女性をターゲットに考えたアプリケーションです。
 出品者は捨てるのはもったいないと考え売りたいが、商品の価値を理解しているので自分で値段設定ができるアプリケーションにしました。
 リサイクルショップで低価格で取引されるよりも自分が納得いく値段で取引をしたいと考えている方向けになっています。　　
購入者の方からしてみればネットで商品が確認できるので、店舗に足を運ぶ手間も省け気になっている商品がないか調べることが可能です。
 
## 要件定義
 ### SNS認証	
 ユーザーアカウント登録方法の選択肢を増やすためです。
 SNSアカウント（Googleアカウン、Facabookアカウント）を利用したログイン方法を選択肢として追加する　　
 
### プレビュー機能	
投稿する際にどの画像を載せるのか再確認できるようにするためです。
新規投稿したり投稿を編集したりする際に、選択した画像がプレビューとして表示されるようにする
プレビュー機能	投稿する際にどの画像を載せるのか再確認できるようにするため	画像のプレビュー機能を実装します。

 
## 実装した機能について
 ### SNS認証機能
トップページからこちらのURL（https://furima-32404.herokuapp.com/users/sign_up）にアクセスすると新規登録画面がご覧いただけます。
新規登録は、ニックネームとメールアドレスの他５項目を記述することで登録が行えます。
SNS（facebookとgoogle）のアカウントを持っている方では、新規登録時にニックネームとメールアドレスは引き継ぐことができるので登録するの項目が減るのでスムーズに登録が可能です。

また、こちらのURL（https://furima-32404.herokuapp.com/users/sign_in）にアクセスするとログイン画面がご覧いただけます。
一度新規登録が済んでいるユーザーの方であれば、SNSアカウントボタン一つ押すだけでログインが可能なためスムーズにサービスを利用することがかのです。

実装にあたって工夫した点は、SNSのアカウントをクリックすることでニックネームとメールアドレスをそのまま引き継ぐことが可能な点です。再入力が不要になっています。

現状、facebookとgoogleだけのSNSアカウントからしかできないので、今後はLineやインスタグラムからも行えるように実装をしていきたいと考えています。

googleアカウントでの新規登録時の動画のURLです。  
動画は新規登録画面にアクセスしているところから始まります。  
https://gyazo.com/46d63676f1fe7837b5d3cb7551f3e688

googleアカウントでのログイン時の動画のURLです。 
動画はログイン画面アクセスしているところから始まります。  
https://gyazo.com/f7b321a31a2ff04223f7c574970c7a5c
 ### プレビュー機能
ログイン後からURL(https://furima-32404.herokuapp.com/items/new)にアクセスすることで出品画面が御覧できます。

出品画像を載せる際には「ファイルを選択」を押してフォルダから画像を選ぶ事で反映されます。

工夫した点は、非同期通信で行ったことと選択するボタンのしたに表示されるようにしてすぐにユーザーの方が確認できるように実装したことです。

現状、画像のサイズがバラバラであるため統一させ見やすくなるように実装していきます。

こちらのURLから動画でご覧できます。  
https://gyazo.com/e1c0d9555c959c6301a2fecb62dfdf71
## 実装予定の機能
DM機能の追加を考えています。出品者と購入者がチャットでやりとりできる機能を実装していきます。
値段の交渉ができるようにチャット形式でやりとりできるようにしたり、商品の状態をより詳しく知りたいなどお互いがより良い形でアプリケーションのサービスを使っていただけるようにしていきます。
 
## データベース設計
 
 ER図をご覧ください  
 https://gyazo.com/0b7feb0daa6518ce8030b98c8c14b03c
 
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


