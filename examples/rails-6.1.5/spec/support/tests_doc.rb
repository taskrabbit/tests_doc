RSpec.configure do |config|
  config.include ::TestsDoc::RecordSpecHelper, type: :request

  config.after :suite do |_|
    # block executed when there is any api interactions were recorded during the rspec
    TestsDoc.with_api_interaction do
      require 'rake'
      require 'tests_doc/tasks'

      Rake::Task['tests_doc:index:build'].invoke TestsDoc.configuration.root_folder
    end
  end
end

TestsDoc.configure do |config|
  config.changes_whitelist_regexes = [
    /"id":.*\n/,
    /_id":.*\n/,
    /_at":.*\n/,
    /.*_ids":\s\[\s*\w+\s*\]/
  ]

  config.add_spec_file_number = true # default: true
  config.add_index_timestamps = true # default: true
  config.debug                = true # default: false
end
