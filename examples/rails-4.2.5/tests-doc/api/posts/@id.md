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
  "id": 298486374,
  "title": "MyString",
  "body": "MyText",
  "user_id": null,
  "created_at": "2015-11-19T01:11:08.000Z",
  "updated_at": "2015-11-19T01:11:08.000Z"
}
```