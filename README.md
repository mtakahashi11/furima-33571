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

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | text       | null: false       |
| category_id      | integer    | null: false       |
| price            | integer    | null: false       |
| condition_id     | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_date_id | integer    | null: false       |
| description      | text       | null: false       |
| user             | references | foreign_key: true |

### Association

- has_one    :purchaser
- belongs_to :user

## purchasers テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchases_history

## purchases history テーブル

| Column           | Type       | Options           |
| ---------------- | -----------| ----------------- |
| zip_code         | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipality     | string     | null: false       |
| street_number    | string     | null: false       |
| building_name    | string     | null: false       |
| telephone_number | string     | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :purchaser