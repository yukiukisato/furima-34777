## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false    |
| email    | string | null: false  unique: true  |
| encrypted_password | string | null: false    |
|encrypted_password_reconfirmation| string | null: false|
| last_name| string | null: false    |
| first_name| string  | null: false   |
|last_name_katakana| string | null: false|
|first_name_katakana| string | null: false |
| birthday | date  | null: false    |

##Association
has_many :items
has_many :historys

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false    |
| version |text| null: false   |
| category_id| integer | null: false |
| status_id | integer |null: false   |
|price| string| null: false|
| user  | references | foreign_key: true |

##Association
belong_to :user
has_many :historys
has_one :listing


## buys テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|postal_code | string    | null: false   |
|prefectures | integer     | null: false   |
|municipality| string      | null: false   |
|address |  string         | null: false   |
|building | string         | 
|phone_number| integer     | null: false   |

##Association
belong_to :history

## historys テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|item | references | foreign_key: true  |
|user | references | foreign_key: true  |

##Association
has_one :buy
belong_to :item
belong_to :user


## listings テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
|shipping_fee_burden_id |integer| null: false|
|delivery_area_id |integer| null: false |
|delivery_day_id| integer | null: false |
|buy| references |foreign_key: true|


##Association
belongs_to :item