# TestsDoc

This library allow to output requests specs into readable markdown files.
It can link the markdown file to the spec ran.

**This library currently only supports RSpec 2**

## Example Output

# GET users

Rspec description: Users GET /users renders users

[spec/requests/users_spec.rb:5](/examples/rails-4.2.5/spec/requests/users_spec.rb#L5)

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
    "email": "MyString",
    "first_name": "MyString",
    "last_name": "MyString",
    "created_at": "2015-11-19T01:11:08.000Z",
    "updated_at": "2015-11-19T01:11:08.000Z"
  },
]
```

## Example App

You can see a [Rails 4 example app](/examples/rails-4.2.5) with the recorded markdown inside the [tests-doc folder](/examples/rails-4.2.5/tests-doc)

## Usage

In your `spec_helper.rb` RSpec file:

```ruby
require 'tests_doc'

config.include ::TestsDoc::RecordSpecHelper, type: :request

TestsDoc.configure do |config|
  config.changes_whitelist_regex      = /(.*\"((id)|([\w]+((_id)|(_at))))\":.*\n)|(.*_ids":\s\[\s*\w+\s*\])/ # default: ""

  # OR
  config.changes_whitelist_regexes = [
    /\"id\":.*\n/,
    /_id\":.*\n/,
    /_at\":.*\n/,
    /.*_ids":\s\[\s*\w+\s*\]/
  ]

  config.root_folder                  = Rails.root.join("api_interactions")  # default: tests-doc
  config.add_spec_file_number         = false                                # default: true
  config.add_index_timestamps         = false                                # default: true
  config.debug                        = true                                 # default: false
end

```

### Generating the Index file

You can generate the index file that list all endpoint using the following rake command.

`rake tests_doc:index:build`

If you want to only build it if there is a git changes on your file:

`rake tests_doc:index:build_if_changed`

You could also specify which folder to use for the index file:

`rake "tests_doc:index:build_if_changed[api_interactions]"`

It's also possible to rewrite the index after the RSpec suite:

```ruby
config.after :suite do |test|
  # block executed when there is any api interactions were recorded during the RSpec
  TestsDoc.with_api_interaction do
    require 'rake'
    require 'tests_doc/tasks'

    Rake::Task["tests_doc:index:build_if_changed"].invoke(TestsDoc.configuration.root_folder)
  end
end
```

## TODO

* Add tests
* Publish gem
* Fix warnings
* RSpec 3 support
