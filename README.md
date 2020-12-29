# furima-33031のER図

## usersテーブル
| Column     | Type   | Option      | 
| ---------- | ------ | ----------- | 
| nickname   | string | null: false | 
| email      | string | null: false | 
| password   | string | null: false | 
| last_name  | string | null: false | 
| first_name | string | null: false | 
| birthday   | date   | null: false | 

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル
| Column           | Type       | Option      | 
| ---------------- | ---------- | ----------- | 
| image            | string     | null: false | 
| item_name        | string     | null: false | 
| item_text        | text       | null: false | 
| category_id      | integer    | null: false | 
| status_id        | integer    | null: false | 
| delivery_id      | integer    | null: false | 
| area_id          | integer    | null: false | 
| delivery_days_id | integer    | null: false | 
| price            | integer    | null: false | 
| user_id          | references |             | 

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## ordersテーブル
| Column  | Type       | Option      | 
| ------- | ---------- | ----------- | 
| user_id | references |             | 
| item_id | references |             | 
| token   | text       | null: false | 

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
| Column        | Type       | Option      | 
| ------------- | ---------- | ----------- | 
| postcode      | integer    | null: false | 
| prefecture_id | integer    | null: false | 
| city          | string     | null: false | 
| block         | string     | null: false | 
| building      | string     |             | 
| phone_number  | integer    | null: false | 
| oder_id       | references |             | 

### Association

- belongs_to :order

## commentsテーブル
| Column  | Type       | Option      | 
| ------- | ---------- | ----------- | 
| text    | string     | null: false | 
| user_id | references |             | 
| item_id | references |             | 

### Association

- belongs_to :user
- belongs_to :item