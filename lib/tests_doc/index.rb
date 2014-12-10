require 'fileutils'

module TestsDoc

  class Index < Struct.new(:endpoints)

    PATH = "api_interactions/README.md"

    def write
      ::File.write(PATH, content)
    end

    private

      def content
        [
          main,
          endpoints_output
        ].flatten.join("\n")
      end

      def main
        strip_heredoc <<-EO
          # Api Interactions

          This document contains a list of api endpoints tested.
          If one of the api endpoint is modified during the test suite if its a deletion,
          make sure this wont affect any of code consuming the api endpoint.

          Last modified at: #{Time.now.strftime("%m/%d/%Y %I:%M%p")}
        EO
      end

      def endpoints_output
        output = [
          "# Endpoints\n"
        ]

        endpoints.each do |endpoint, files|
          output << "##{endpoint}"
          output += files.map(&method(:endpoint_file_text))
        end

        output
      end

      def endpoint_file_text(endpoint)
        "[#{endpoint}](#{endpoint.gsub(/^\//, '')})\n"
      end

      # copied from activesupport/lib/active_support/core_ext/string/strip.rb, line 22
      def strip_heredoc(string)
        indent = string.scan(/^[ \t]*(?=\S)/).min.try(:size) || 0
        string.gsub(/^[ \t]{#{indent}}/, '')
      end

    # /private

  end

end