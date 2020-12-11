## Userテーブル

|Column                      |Type     |Options       |
|----------------------------|---------|------------- |
| nickname                   | string  | null: false  |
| email                     | string  | unique: true, null: false |
| encrypted_password         | string  | null: false  |
| family_name                | string  | null: false  |
| first_name                 | string  | null: false  |
| family_name_kana           | string  | null: false  |
| first_name_kana            | string  | null: false  |
| birthday                   | date    | null: false  |



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
| user_id          | integer    | foreign_key: true|




### Association
belongs_to :user
has_one    :purchase




## Purchaseテーブル

|Column            |Type        |Options           |
|------------------|------------|------------------|
| user_id          | integer    | foreign_key; true|
| item_id          | integer    | foreign_key; true|


### Association
belongs_to :user
belongs_to :items
has_one    :destinaition


## Destinaitionテーブル

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
