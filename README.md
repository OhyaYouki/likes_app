# README

## DB 設計

## users table

| Column             | Type                | Options                      |
| ------------------ | ------------------- | ---------------------------- |
| id                 |                     | null: false                  |
| nickname           | string              | null: false                  |
| email              | devise のデフォルト   | null: false                  |
| encrypted_password | devise のデフォルト   | null: false                  |

### Association

* has_many :posts
* has_many :likes

## posts table

| Column              | Type               | Options                       |
| ------------------- | ------------------ | ----------------------------- |
| id                  |                    | null: false                   |
| content             | string             | null: false                   |
| user                | references         | null: false,foreign_key: true |

### Association

* belongs_to :user
* has_many :likes

## likes table

| Column              | Type               | Options                       |
| ------------------- | ------------------ | ----------------------------- |
| id                  |                    | null: false                   |
| item                | references         | null: false,foreign_key: true |
| user                | references         | null: false,foreign_key: true |

### Association

* belongs_to :user
* belongs_to :post

## 備考
