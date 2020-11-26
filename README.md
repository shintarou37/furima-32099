# テーブル設計

## users テーブル
| Colum           | Type   | Options                                |
| --------        | ------ | ----------                             |
| name            | string | null: false,                           |
| email           | string | null: false,                           |
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
| user_id         | references| null: false, foreign_key: true    |
| category_id     | integer   | null: false                       |
| status_id       | integer   | null: false                       |
| delivery_fee_id | integer   | null: false                       |
| days_id         | integer   | null: false                       |
| prefectures     | string    | null: false                       |

### Association

- belongs_to :user
- has_one  :buyer

## buyers テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| items_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| address       | string     | null: false,                   |
| post          | integer    | null: false,                   |
| prefectures   | string     | null: false,                   |
| town          | string     | null: false,                   |
| build         | string     |                                |
| phone         | integer    | null: false,                   |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
