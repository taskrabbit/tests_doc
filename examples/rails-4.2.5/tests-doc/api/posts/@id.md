# GET posts/@id

Rspec description: Posts GET /posts/:id renders posts with id

[spec/requests/posts_spec.rb:22](/spec/requests/posts_spec.rb#L22)

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
  "title": null,
  "body": null,
  "user_id": 1,
  "created_at": "2019-06-18T21:34:32.172Z",
  "updated_at": "2019-06-18T21:34:32.172Z"
}
```