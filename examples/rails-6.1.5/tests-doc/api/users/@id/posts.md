# GET users/@id/posts

Rspec description: User GET /users/:user_id/posts renders posts

[spec/requests/users_spec.rb:18](/spec/requests/users_spec.rb#L18)

# Parameters

```json
{
}
```

# Response

```
HTTP CODE = 200
```

```json
[
  {
    "id": 1,
    "user_id": 1,
    "title": "Title",
    "body": "Body",
    "created_at": "2022-03-16T06:19:10.070Z",
    "updated_at": "2022-03-16T06:19:10.070Z"
  }
]
```