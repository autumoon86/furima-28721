# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :exhibitions

## items テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| text             | text       | null: false                    |
| status_id        | integer    | null: false                    |
| user             | references | null :false, foreign_key :true |
| delivery_fee_id  | integer    | null :false                    |
| shipping_area_id | integer    | null :false                    |
| delivery_time_id | integer    | null :false                    |

### Association

- has_many :comments
- has_one :exhibition
- belongs_to :user

## deliveries テーブル

| Column           | Type       | Option                          |
| ---------------- | ---------- | ------------------------------- | 
| postcode         | string     | null: false                     |
| prefecture_id    | integer    | null: false                     |
| city             | string     | null: false                     |
| block            | string     | null: false                     |
| building         | string     |                                 |
| phone_number     | string     | null: false                     |
| exhibition       | references | null: false, foreign_key :true  |


### Association

- belongs_to :exhibition

## comments テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | string     | null ;false                    |
| user   | references | null :false, foreign_key :true |
| item   | references | null :false, foreign_key :true |

### Association

- belongs_to :users
- belongs_to :items

## exhibitions テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null :false, foreign_key :true |
| item    | references | null :false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery
