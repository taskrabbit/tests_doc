# TestsDoc

This gems allow to output requests specs into readable mdown files.

It links the output to the example file where it was runned.

## Usage

In your spec_helper.rb RSpec file:

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
  config.controller_params_to_exclude = %w{controller action format api_key} # default: %w{controller action format}
  config.debug                        = true                                 # default: false
end

```

You can generate the index file that list all endpoint using the following rake command.

    rake tests_doc:index:build

If you want to only build it if there is a git changes on your file run.

    rake tests_doc:index:build_if_changed

You could also specify which folder to use for the index file/

    rake "tests_doc:index:build_if_changed[api_interactions]"

It's also possible to rewrite the index when the rspec suite has been runned.

```ruby
config.after :suite do |test|
  # block executed when there is any api interactions were recorded during the rspec
  TestsDoc.with_api_interaction do
    require 'rake'
    require 'tests_doc/tasks'

    Rake::Task["tests_doc:index:build_if_changed"].invoke(TestsDoc.configuration.root_folder)
  end
end
```

## TODO

1. Add tests
2. Publish gem

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
