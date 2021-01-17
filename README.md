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

| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| message      | text       | null: false                    |
| category     | integer    | null: false                    |
| state        | integer    | null: false                    |
| delivery_fee | integer    | null: false                    |
| prefectures  | integer    | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buy_records

## buy_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :item
- has_one :user_address

##  user_addressテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefectures  | integer    | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone_num    | string     | null: false, foreign_key: true |
| buy_record   | references | null: false, foreign_key: true |

### Association

- belongs_to :buy_records