# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| birthday           | date                | null: false               |
| name               | string              | null: false               |
| surname            | string              | null: false               |
| name_pseudonym     | string              | null: false               |
| surname_pseudonym  | string              | null: false               |


### Association

* has_many :items
* has_many :purchases

## items table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| product_name    | string     | null: false                    |
| explanation     | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| category_id     | integer    | null: false                    |
| product_condition_id| integer| null: false                    |
| shipping_charge_id | integer | null: false                    |
| prefecture_id      | integer | null: false                    |
| days_to_ship_id  | integer   | null: false                    |




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
| prefecture_id | integer   | null: false                     |
| municipality  | string    | null: false                     |
| address       | string    | null: false                     |
| building_name | string    |                                 |
| phone_number  | string    | null: false                     |
| purchase      | references| null: false, foreign_key: true  |

### Association

- belongs_to :purchase



