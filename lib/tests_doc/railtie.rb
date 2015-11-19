require 'tests_doc'
require 'rails'

module TestsDoc
  class Railtie < Rails::Railtie
    rake_tasks do
      load ::File.expand_path('../tasks.rb', __FILE__)
    end
  end
end
