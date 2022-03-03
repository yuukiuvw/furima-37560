# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| product_name    | text       | null: false                    |
| explanation     | text       | null: false                    |
| seller          | text       | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column      | Type      | Options                         |
|-------------|-----------|---------------------------------|
| user_id    | references | null: false, foreign_key: true  |
| item_id    | references | null: false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :shipping_address
## shipping_address

| Column        | Type      | Options                         |
|-------------  |-----------|---------------------------------|
| post_code     | string    | null: false                     |
| prefectures   | string    | null: false                     |
| municipality  | string    | null: false                     |
| address       | string    | null: false                     |
| building_name | text      | unique: true                    |
| phone_number  | string    | null: false                     |
| item_id       | references| null: false, foreign_key: true  |

### Association

- belongs_to :purchases

