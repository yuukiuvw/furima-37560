# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| name               | string              | null: false               |
| pseudonym          | string              | null: false               |
| birthday           | string              | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| product_name    | string     | null: false                    |
| explanation     | text       | null: false                    |
| seller          | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column      | Type      | Options                         |
|-------------|-----------|---------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
 
### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address
## shipping_address

| Column        | Type      | Options                         |
|-------------  |-----------|---------------------------------|
| post_code     | string    | null: false                     |
| prefectures_id| integer   | null: false                     |
| municipality  | string    | null: false                     |
| address       | string    | null: false                     |
| building_name | string    |                                 |
| phone_number  | string    | null: false                     |
| purchase      | references| null: false, foreign_key: true  |

### Association

- belongs_to :purchase

