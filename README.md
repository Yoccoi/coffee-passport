# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| birthday       | date    | null: false |

### Association

- has_many :notes

## notes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| rating                 | float      | null: false                    |
| comment                | text       |                                |
| bitter                 | float      |                                |
| acidity                | float      |                                |
| aroma                  | float      |                                |
| body                   | float      |                                |
| roast_date             | date       |                                |
| grams                  | integer    |                                |
| price                  | integer    |                                |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shop

## shops テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| purchase_date   | string     |                                |
| location        | string     |                                |
| note_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :note
