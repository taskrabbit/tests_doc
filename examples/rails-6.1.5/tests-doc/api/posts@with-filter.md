# GET posts

Rspec description: Post GET /posts renders posts with filter

[spec/requests/posts_spec.rb:16](/spec/requests/posts_spec.rb#L16)

# Parameters

```json
{
  "published": "true"
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
    "created_at": "2022-03-16T06:23:18.334Z",
    "updated_at": "2022-03-16T06:23:18.334Z"
  }
]
```