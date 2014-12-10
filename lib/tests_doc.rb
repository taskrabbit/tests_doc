require "tests_doc/version"
require 'tests_doc/railtie' if defined?(Rails)

module TestsDoc
  autoload :Interaction,              'tests_doc/interaction'
  autoload :Index,                    'tests_doc/index'
  autoload :DisabledRecordSpecHelper, 'tests_doc/disabled_record_spec_helper'
  autoload :RecordSpecHelper,         'tests_doc/record_spec_helper'
  autoload :Configuration,            'tests_doc/configuration'
  autoload :File,                     'tests_doc/file'

  mattr_accessor :recorded_api_interaction
  mattr_accessor :interaction_options

  class << self

    def with_api_interaction
      yield if recorded_api_interaction
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

  end

end
