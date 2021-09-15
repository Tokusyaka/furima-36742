# テーブル設計

## users テーブル

| Column             | Type   | Options                | 
| ------------------ | ------ | ---------------------- | 
| nickname           | string | NOT NULL               | 
| email              | string | NOT NULL, unique: true | 
| encrypted_password | string | NOT NULL               | 
| first_name         | string | NOT NULL               | 
| last_name          | string | NOT NULL               | 
| first_name_kana    | string | NOT NULL               | 
| last_name_kana     | string | NOT NULL               | 
| birthday           | date   | NOT NULL               | 

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| explanation      | text       | NOT NULL          |
| category_id      | integer    | NOT NULL          |
| status_id        | integer    | NOT NULL          |
| postage_id       | integer    | NOT NULL          |
| prefecture_id    | integer    | NOT NULL          |   
| delivery days_id | integer    | NOT NULL          | 
| price            | integer    | NOT NULL          | 
| user_id          | references | foreign_key: true | 


### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column  | Type       | Options           | 
| ------- | ---------- | ----------------- | 
| user_id | references | foreign_key: true | 
| item_id | references | foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_many :deliveries

## deliveries テーブル

| Column         | Type       | Options           | 
| -------------- | ---------- | ----------------- | 
| post code      | string     | NOT NULL          |
| prefecture_id  | integer    | NOT NULL          |
| municipalities | string     | NOT NULL          |
| block number   | string     | NOT NULL          |
| phone          | string     | NOT NULL          |
| building name  | string     | NOT NULL          |
| user_id        | references | foreign_key: true |

### Association

- belongs_to :purchase