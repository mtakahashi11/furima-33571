# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |
| full name          | string   | null: false |
| full name katakana | string   | null: false |
| date of birth      | datetime | null: false |

### Association

- has_many :items
- has_one  :purchaser

## items テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| item           | text       | null: false |
| category       | text       | null: false |
| price          | integer    | null: false |
| exhibitor      | string     | null: false |
| condition      | text       | null: false |
| delivery fee   | integer    | null: false |
| country        | string     | null: false |
| delivery date  | datetime   | null: false |
| image          | image      | null: false |
| description    | text       | null: false |
| user           | references |             |

### Association

- has_one    :purchaser
- belongs_to :user

## purchasers テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| purchaser   | text       | null: false |
| address     | text       | null: false |
| credit card | references | null: false |

### Association

- belongs_to :user
- belongs_to :item