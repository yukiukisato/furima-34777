## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false    |
| email    | string | null: false  unique: true  |
| encrypted_password | string | null: false    |
| last_name| string | null: false    |
| first_name| string  | null: false   |
|last_name_katakana| string | null: false|
|first_name_katakana| string | null: false |
| birthday | date  | null: false    |

##Association
has_many :items
has_many :histories

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false    |
| version |text| null: false   |
| category_id| integer | null: false |
| status_id | integer |null: false   |
|shipping_fee_burden_id |integer| null: false|
|delivery_area_id |integer| null: false |
|delivery_day_id| integer | null: false |
|price| integer| null: false|
| user  | references | foreign_key: true |

##Association
belongs_to :user
has_one :history


## buys テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|postal_code | string    | null: false   |
| delivery_area_id| integer     | null: false   |
|municipality| string      | null: false   |
|address |  string         | null: false   |
|building | string         | 
|phone_number| string    | null: false   |
|history| references | foreign_key: true |

##Association
belongs_to :history

## histories テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|item | references | foreign_key: true  |
|user | references | foreign_key: true  |

##Association
has_one :buy
belongs_to :item
belongs_to :user

