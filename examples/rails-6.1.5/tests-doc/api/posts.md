# GET posts

Rspec description: Post GET /posts renders posts

[spec/requests/posts_spec.rb:9](/spec/requests/posts_spec.rb#L9)

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
    "created_at": "2022-03-16T06:23:18.325Z",
    "updated_at": "2022-03-16T06:23:18.325Z"
  }
]
```