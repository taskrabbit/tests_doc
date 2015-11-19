module TestsDoc

  class Configuration

    def self.config(property, default = nil)
      attr_writer property

      define_method property do
        value = instance_variable_get("@#{property}")

        value.nil? ? default : instance_variable_get("@#{property}")
      end
    end

    config :changes_whitelist_regex, ""
    config :add_spec_file_number, true
    config :add_index_timestamps, true
    config :debug, false
    config :logger, TestsDoc::Logger
    config :changes_whitelist_regexes, []
    config :root_folder, "tests-doc"
    config :doc_folder, "api"
  end

end
