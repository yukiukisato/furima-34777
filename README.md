## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false    |
| email    | string | null: false    |
| password | string | null: false    |
|password_reconfirmation| string | null: false|
| last_name| string | null: false    |
| first_name| string  | null: false   |
|last_name_katakana| string | null: false|
|first_name_katakana| string | null: false |
| birthday | date  | null: false    |

##Association
has_many :items
belong_to :buy
has_many :items, thorough: :historys

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false    |
| version |text| null: false   |
| category| integer | null: false |
| status | integer |null: false   |
|price| string| null: false|
| user_id  | references | foreign_key: true |

##Association
belong_to :user
belong_to :buy
has_many :users, through: :historys

## buys テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|postal_code | integer     | null: false   |
|prefectures | integer     | null: false   |
|municipality| string      | null: false   |
|address |  string         | null: false   |
|building | string         | null: false   |
|phone_number| integer     | null: false   |
| user_id    | references |foreign_key: true |
| item_id    | references |foreign_key: true |

##Association
has_one :item
has_one :user
has_one :listing

## historys テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|item_id | references | foreign_key: true  |
|user_id | references | foreign_key: true  |

##Association
belongs_to :user
belongs_to :item


## listings テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|shipping_fee_burden |integer| null: false|
|delivery_area |integer| null: false |
|delivery_day| integer | null: false |
|buy_id| references |foreign_key: true|


##Association
belongs_to :user