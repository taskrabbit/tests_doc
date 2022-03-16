# GET users

Rspec description: User GET /users renders users

[spec/requests/users_spec.rb:7](/spec/requests/users_spec.rb#L7)

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
    "first_name": "First",
    "last_name": "Last",
    "email": "demo@example.com",
    "created_at": "2022-03-16T06:19:10.055Z",
    "updated_at": "2022-03-16T06:19:10.055Z"
  }
]
```