# テーブル設計

## users テーブル
| Colum             | Type   | Options                   |
| --------          | ------ | ----------                |
| name              | string | null: false               |
| email             | string | null: false, unique: true |
| last_name         | string | null: false,              |
| first_name        | string | null: false,              |
| last_name_kana    | string | null: false,              |
| first_name_kana   | string | null: false,              |
| birthday          | date   | null: false,              |
| encrypted_password| string | null: false,              |

### Association

- has_many :orders
- has_many :items

## items テーブル

| Column          | Type      | Options                           |
| ------          | ------    | -----------                       |
| name            | string    | null: false,                      |
| explanation     | text      | null: false,                      |
| price           | integer   | null: false                       |
| user            | references| null: false, foreign_key: true    |
| category_id     | integer   | null: false                       |
| status_id       | integer   | null: false                       |
| delivery_fee_id | integer   | null: false                       |
| day_id          | integer   | null: false                       |
| prefecture_id   | integer   | null: false                       |

### Association

- belongs_to :user
- has_one  :order

## order テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| address          | string     | null: false,                   |
| post             | string     | null: false,                   |
| prefecture_id    | integer    | null: false,                   |
| town             | string     | null: false,                   |
| build            | string     |                                |
| phone            | string     | null: false,                   |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
