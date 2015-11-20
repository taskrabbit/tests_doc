# GET posts

Rspec description: Posts GET /posts renders posts

[spec/requests/posts_spec.rb:5](/spec/requests/posts_spec.rb#L5)

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
    "id": 298486374,
    "title": "MyString",
    "body": "MyText",
    "user_id": null,
    "created_at": "2015-11-19T01:11:08.000Z",
    "updated_at": "2015-11-19T01:11:08.000Z"
  },
  {
    "id": 980190962,
    "title": "MyString",
    "body": "MyText",
    "user_id": null,
    "created_at": "2015-11-19T01:11:08.000Z",
    "updated_at": "2015-11-19T01:11:08.000Z"
  }
]
```