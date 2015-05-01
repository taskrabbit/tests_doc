require 'fileutils'

module TestsDoc

  class Interaction < Struct.new(:example, :request, :response, :options)

    def record
      return if response.code.to_s == "500"

      TestsDoc::File.new(file_path, output, options).write_if_changed
    end

    private

      def output
        [
          description_content,
          params_content,
          response_content
        ].compact.join("\n\n")
      end

      def description_content
        [
          "# #{request.method} #{_path}\n",
          options.description,
          "Rspec description: #{example.full_description}\n",
          formatted_example_location,
        ].compact.join("\n")
      end

      def params_content
        [
          "# Parameters\n",
          "```json",
          JSON.pretty_generate(request.request_parameters.merge(request.query_parameters).symbolize_keys),
          "```"
        ].join("\n")
      end

      def response_content
        [
          "# Response\n",
          "```",
          "HTTP CODE = #{response.code}",
          "```\n",
          "```json",
          (response.body.present? ? JSON.pretty_generate(JSON[response.body]) : ""),
          "```"
        ].join("\n")
      end

      def file_path
        [file_base_path, options.key.to_s].reject(&:blank?).compact.join('-') + '.md'
      end

      def file_base_path
        ::File.join(TestsDoc.configuration.root_folder, _path)
      end

      def _path
        options.path ? options.path.gsub(/^\//, '') : request_path_without_format
      end

      def request_path_without_format
        request.path[/^\/?(.+)[.].+/, 1].to_s
      end

      def formatted_example_location
        path = if TestsDoc.configuration.add_spec_file_number
                 example.location
               else
                 example.file_path
               end
        path = path.gsub(/^.\//, "")

        "[#{path}](/#{path.gsub(":", '#L')})"
      end

    # /private

  end

end
