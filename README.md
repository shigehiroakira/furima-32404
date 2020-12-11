## Userテーブル

|Column            |Type     |Options      |
|------------------|---------|-------------|
| nickname         | string  | null: false |
| emaile           | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | stiring | null: false |
| first_name_kana  | stiring | null: false |
| birth_day        | string  | null: false |



### Association
has_many   :items
has_one :purchuse


## Itemテーブル

|Column         |Type        |Options           |
|---------------|------------|------------------|
| name          | string     | null: false      |
| price         | integer    | null: false      |
| description   | string     | null: false      | 
| status        | string     | null: false      |
| shipping_cost | string     | null: false      |
| shipping_days | string     | null: false      |
| category_id   | string     | null: false      |
| user_id       | references | foreign_key: true|
| category_id   | references | foreign_key: true|



### Association
belongs_to :user
belongs_to :purchase
has_many   :categorys



## Purchaseテーブル

|Column            |Type        |Options           |
|------------------|------------|------------------|
| family_name      | string     | null: false      |
| first_name       | string     | null: false      |
| family_name_kana | stiring    | null: false      |
| first_name_kana  | stiring    | null: false      |
| user_id          | references | foreign_key; true|
| item_id          | references | foreign_key; true|
| destination      | references | foreign_key; true|

### Association
belongs_to :user
has_one    :destination
has_many   :items


## Destinaitionテーブル

|Column        |Type        |Options           |
|--------------|------------|------------------|
| post_code    |string      | null: false      |
| prefecture   |string      | null: false      |
| city         |string      | null: false      |
| address      |string      | null: false      |
| building_name|string      | null: false      |
| phone_number |string      | null: false      |
| purchase     | references | foreign_key; true|



### Association
belongs_to :purchase

## Categoryテーブル

|Column    |Type    |Options      |
|----------|--------|-------------|
| name     | string | null: false |
| ancestry |        |             |


### Association

belongs_to :item