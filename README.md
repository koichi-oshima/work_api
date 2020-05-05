# テスト実行
bundle exec rspec

# rubocop実行

# api取得
http://localhost:3000/api/v1/lectures?keyword=統計&teacher_name=太郎
```
[
    {
        "id": 1,
        "title": "統計基礎",
        "weekday": "Monday",
        "period": 1,
        "teacher": {
            "id": 1,
            "name": "山田太郎"
        },
        "lectures": [
            {
                "id": 1,
                "title": "ガイダンス",
                "date": "2020-04-23"
            },
            {
                "id": 2,
                "title": "確率変数と確率分布",
                "date": "2020-04-30"
            }
        ]
    }
]
```
