# テーブル設計

## users テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| nickname            | string   | null: false |
| email               | string   | null: false |
| encrypted_password  | string   | null: false |
| first_name          | string   | null: false |
| last_name           | string   | null: false |
| first_name_katakana | string   | null: false |
| last_name_katakana  | string   | null: false |
| date_of_birth       | date     | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_name        | text       | null: false |
| category_id      | integer    | null: false |
| price            | integer    | null: false |
| condition_id     | integer    | null: false |
| delivery_fee_id  | integer    | null: false |
| country_id       | integer    | null: false |
| delivery_date_id | integer    | null: false |
| description      | text       | null: false |
| user             | references | null: false |

### Association

- has_one    :purchasers
- belongs_to :user

## purchasers テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| item   | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchases_history

## purchases history テーブル

| Column           | Type       | Options     |
| ---------------- | -----------| ----------- |
| zip_code         | integer    | null: false |
| prefectures      | text       | null: false |
| municipality     | text       | null: false |
| street_number    | text       | null: false |
| building_name    | text       | null: false |
| telephone_number | integer    | null: false |
| user             | references | null: false |

### Association

- belongs_to :purchaser