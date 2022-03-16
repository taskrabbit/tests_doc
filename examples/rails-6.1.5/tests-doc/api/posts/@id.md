# GET posts/@id

Rspec description: Post GET /posts/:id renders posts with id

[spec/requests/posts_spec.rb:27](/spec/requests/posts_spec.rb#L27)

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
{
  "id": 1,
  "user_id": 1,
  "title": "Title",
  "body": "Body",
  "created_at": "2022-03-16T06:23:18.336Z",
  "updated_at": "2022-03-16T06:23:18.336Z"
}
```