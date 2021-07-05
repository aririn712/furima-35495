# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_kana          | string  | null: false |
| first_kana         | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| description | text       | null: false       |
| category    | string     | null: false       |
| status      | string     | null: false       |
| bearer      | string     | null: false       |
| area        | string     | null: false       |
| days        | string     | null: false       |
| price       | integer    | null: false       |
| image       |            | null: false       |
| user_id     | references | foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| card_num   | integer    | null: false       |
| card_month | integer    | null: false       |
| card_day   | integer    | null: false       |
| card_code  | integer    | null: false       |
| user_id    | references | foreign_key: true |
| item_id    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options          |
| ------------ | ---------- | ---------------- |
| post_code    | integer    | null: false      |
| prefecture   | string     | null: false      |
| municipality | string     | null: false      |
| address      | integer    | null: false      |
| building     | string     |                  |
| phone        | integer    | null: false      |
| purchase_id  | references |foreign_key: true |


### Association

- belongs_to :purchase
