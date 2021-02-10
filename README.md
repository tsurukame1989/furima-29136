# DB設計図

## users テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| nickname     | string     | null: false |
| email        | string     | null: false |
| password     | string     | null: false |
| name         | string     | null: false |
| name_reading | string     | null: false |
| birth_year   | integer    | null: false |
| birth_month  | integer    | null: false |
| birth_day    | integer    | null: false |


### Association

- has_many :items
- has_many :coments
- has_many :buyers

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_image      | string     | null: false                    |
| item_name       | string     | null: false                    |
| item_info       | string     | null: false                    |
| category        | integer    | null: false                    |
| condition       | string     | null: false                    |
| delivery_fee    | integer    | null: false                    |
| delivery_source | string     | null: false                    |
| delivery_days   | integer    | null: false                    |
| value           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :users
- has_one :orders

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items


## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| price        | integer    | null: false                    |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |  

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses


## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |  
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
- belongs_to :orders