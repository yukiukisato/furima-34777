## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | NOT NULL    |
| email    | string | NOT NULL    |
| password | string | NOT NULL    |
| last_name| string | NOT NULL    |
| first_name| string  | NOT NUlL    |
| birthday | date  | NOT NULL    |

##Association
has_many :items
belong_to :buy


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  |ActiveStorageで実装|
| item_name | string | NOT NULL    |
| item_version |text| NOT NULL    |
| category| integer | NOT NULL      |
| status | integer |NOT NULL    |
|shipping_fee_burden |integer| NOT NULL|
|delivery_area |integer| NOT NULL |
|delivery_day| integer | NOT NULL |
|price| string| NOT NULL|
| user   | references |

##Association
belong_to :user
belong_to :buy

## buys テーブル

| Column   | Type   | Options     |
|----------|--------|-------------|
| card_number   | integer  | NOT NULL    |
|expiration_date| integer  | NOT NULL    |
|security_code| integer    | NOT NULL    |
|postal_code | integer     | NOT NULL    |
|prefectures | integer     | NOT NULL    |
|municipality| string      | NOT NULL    |
|address |  string         | NOT NULL    |
|building | string         | NOT NULL    |
|phone_number| integer     | NOT NULL    |
| user     | references |
| item| references |

##Association
belong_to :item
belong_to :user
