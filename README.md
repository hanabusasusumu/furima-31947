## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| password            | string  | null: false               |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| first_name_furigana | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :buy_records

##  itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| message         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| days_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_record

## buy_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :user_address

##  user_addressテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_num      | string     | null: false, foreign_key: true |
| buy_record     | references | null: false, foreign_key: true |

### Association

- belongs_to :buy_record