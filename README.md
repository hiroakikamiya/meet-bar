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

## users_restaurantsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|restaurant_id|references|foreign_key: true|

### Association
- belongs_to :restaurant
- belongs_to :user

## restaurantsテーブル

|Column|Type|Options|
|------|----|-------|
|shop_name|string|null: false|
|time|datetime|null: false|
|address|string|null: false|
|capacity|integer|null: false|
|price|integer|null: false|
|catchcopy|string|null: false|
|comment|text|


### Association
- has_many :users, through: :restaurants_users
- has_many :restaurants_users
- has_many :images


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :restaurants, through: :restaurants_users
- has_many :restaurants_users


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|restaurant_id|references|foreign_key: true|
|comments|text|      |
|image|text|     |

### Association
- belongs_to :restaurant

