## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | text    | null: false |
| email         | text    | null: false |
| password      | text    | null: false |
| name          | text    | null: false |
| name_furigana | text    | null: false |
| birthday      | integer | null: false |

### Association

- has_many :items
- has_many :buy_records

##  itemsテーブル

| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| message      | string     | null: false                    |
| category     | text       | null: false                    |
| state        | text       | null: false                    |
| delivery_fee | text       | null: false                    |
| prefectures  | text       | null: false                    |
| days         | text       | null: false                    |
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
| user_address | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :item
- has_one :user_address

##  user_addressテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal_code  | integer | null: false                    |
| prefectures  | text    | null: false                    |
| municipality | string  | null: false                    |
| address      | string  | null: false                    |
| building     | string  | null: false                    |
| phone_num    | integer | null: false, foreign_key: true |

### Association

- has_one :buy_records