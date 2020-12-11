## Userテーブル

|Column                      |Type     |Options       |
|----------------------------|---------|------------- |
| nickname                   | string  | null: false  |
| emaile                     | string  | unique: true |
| encrypted_password         | string  | null: false  |
| family_name                | string  | null: false  |
| first_name                 | string  | null: false  |
| family_name_kana           | string  | null: false  |
| first_name_kana            | string  | null: false  |
| date                       | string  | null: false  |



### Association
has_many   :items
has_many :purchuses


## Itemテーブル

|Column            |Type        |Options           |
|------------------|------------|------------------|
| name             | string     | null: false      |
| price            | integer    | null: false      |
| description      | string     | null: false      | 
| status_id        | string     | null: false      |
| shipping_cost_id | string     | null: false      |
| shipping_day_id  | string     | null: false      |
| prefecture_id    | string     | null: false      |
| category_id      | string     | null: false      |
| user_id          | references | foreign_key: true|
| category_id      | references | foreign_key: true|



### Association
belongs_to :user
belongs_to :purchase
has_many   :categorys



## Purchaseテーブル

|Column            |Type        |Options           |
|------------------|------------|------------------|
| user_id          | references | foreign_key; true|
| item_id          | references | foreign_key; true|


### Association
belongs_to :user
has_many   :items


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
