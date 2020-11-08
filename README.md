## usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false                    |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_kana     | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | date   | null: false                    |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| item_name         | string    | null: false,                   |
| description       | text      | null: false,                   |
| category_id       | integer   | null: false,                   |
| condition_id      | integer   | null: false,                   |
| shipping_id       | integer   | null: false,                   |
| departure_area_id | integer   | null: false,                   |
| duration_id       | integer   | null: false,                   |
| price             | integer   | null: false,                   |
| user              | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| item        | reference | null: false, foreign_key: true |
| user        | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :receiver


## receiversテーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| zip_code      | string    | null: false,                   |
| prefecture_id | integer   | null: false,                   |
| address       | string    | null: false,                   |
| street_number | string    | null: false,                   |
| phone_number  | string    | null: false,                   |
| building_name | string    |                                |
| purchase      | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase

