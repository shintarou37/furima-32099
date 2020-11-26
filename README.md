# テーブル設計

## users テーブル
| Colum           | Type   | Options                                |
| --------        | ------ | ----------                             |
| name            | string | null: false, unique: true              |
| email           | string | null: false, unique: true              |
| last_name       | string | null: false, /\A[０-９]+\z/(全角)       |
| first_name      | string | null: false, /\A[０-９]+\z/(全角)       |
| last_name_kana  | string | null: false, /\A[ァ-ヶー－]+\z/(全角カナ)|
| first_name_kana | string | null: false, /\A[ァ-ヶー－]+\z/(全角カナ)|
| birthday        | date   | null: false,                           |

### Association

- has_many :buyers
- has_many :items

## items テーブル

| Column          | Type      | Options                           |
| ------          | ------    | -----------                       |
| name            | string    | null: false, maximum 40           |
| explanation     | string    | null: false, maximum 1000         |
| price           | integer   | null: false                       |
| user            | references| null: false, foreign_key: true    |
| category_id     | integer   | null: false                       |
| status_id       | integer   | null: false                       |
| delivery_fee_id | integer   | null: false                       |
| day_id          | integer   | null: false                       |
| prefecture_id   | integer   | null: false                       |

### Association

- belongs_to :user
- has_one  :buyer

## buyers テーブル

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
| buyer            | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
