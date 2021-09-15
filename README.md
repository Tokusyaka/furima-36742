# テーブル設計

## users テーブル

| Column                  | Type   | Options  | 
| ----------------------- | ------ | -------- | 
| nickname                | string | NOT NULL | 
| email                   | string | NOT NULL | 
| encrypted_password      | string | NOT NULL | 
| name                    | string | NOT NULL | 
| birthday                | string | NOT NULL | 

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options  | 
| ------------- | ---------- | -------- | 
| explanation   | text       | NOT NULL | 
| category      | string     | NOT NULL | 
| status        | string     | NOT NULL | 
| shipping pay  | integer    | NOT NULL | 
| shipping from | string     | NOT NULL | 
| delivery days | integer    | NOT NULL | 
| price         | integer    | NOT NULL | 
| user_id       | references |          | 


### Association

- has_one :purchases
- belongs_to :users

## purchases テーブル

| Column  | Type       | Options | 
| ------- | ---------- | ------- | 
| user_id | references |         | 
| item_id | references |         | 

### Association

- belongs_to :users
- belongs_to :items
- has_many :deliveries

## deliveries テーブル

| Column         | Type       | Options  | 
| -------------- | ---------- | -------- | 
| post code      | integer    | NOT NULL | 
| prefectures    | string     | NOT NULL | 
| municipalities | string     | NOT NULL | 
| block number   | string     | NOT NULL | 
| phone          | integer    | NOT NULL | 
| user_id        | references |          | 

### Association

- belongs_to :purchases