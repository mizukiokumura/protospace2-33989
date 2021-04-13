# protospaceのテーブル設計

## usersテーブル

| Column    | Type    | Options          |
| --------- | ------- | -----------------|
| name      | string  | null: false      |
| email     | string  | null: false      |
| password  | string  | null: false      |
| profile   | text    | null: false      |
| occupation| text    | null: false      |
| position  | text    | null: false      |

### Association

- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | string     | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| text         | text       | null: false                     |
| user         | references | null: false foreign_key: true   |
| prototype    | references | null: false foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :prototype