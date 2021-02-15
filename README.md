# DB設計図

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_reading | string     | null: false               |
| last_name_reading  | string     | null: false               |
| birthday           | date       | null: false               |


### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- has_many :comments
- belongs_to :user
- has_one :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |  

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |  
| delivery_source_id | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order