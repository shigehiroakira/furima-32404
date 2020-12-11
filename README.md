## Userテーブル

|Column     |Type   |Options      |
|-----------|-------|-------------|
| nickname | string | null: false |
| emaile   | string | null: false |
| password | string | null: false |


### Association
has_many   :items
belongs_to :purchuse


## Itemテーブル

|Column   |Type        |Options           |
|---------|------------|------------------|
| name    | string     | null: false      |
| price   | integer    | null: false      |
| user_id | references | foreign_key; true|
| purchase| references | foreign_key; true|


### Association
belongs_to :user
belongs_to :purchase



## Purchaseテーブル

|Column      |Type        |Options           |
|------------|------------|------------------|
| user_id    | references | foreign_key; true|
| item_id    | references | foreign_key; true|
| destination| references | foreign_key; true|

### Association
belongs_to :user
has_one    :destination
has_many   :items


## Destinaitionテーブル

|Column    |Type        |Options           |
|----------|------------|------------------|
|address   |string      | null: false      |
| purchase | references | foreign_key; true|



### Association
belongs_to :purchase