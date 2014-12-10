module TestsDoc

  class Configuration

    def self.config(property, default = nil)
      attr_writer property

      define_method property do
        instance_variable_get("@#{property}") || default
      end
    end

    config :changes_whitelist_regex, ""
    config :changes_whitelist_regexes, []
    config :controller_params_to_exclude, %w{controller action format}
    config :root_folder, "tests-doc"
  end

end