require 'fileutils'

module TestsDoc

  class File < Struct.new(:path, :output, :options)

    def write_if_changed
      ensure_folder

      if write_output?
        ::File.open(path, 'w+') do |f|
          f.write(output)
        end
      end
    end

    private

      def write_output?
        return true unless ::File.file?(path)

        response_changed?
      end

      def response_changed?
        if TestsDoc.configuration.debug
          diff = filtered_file_content.split("\n") - filtered_output.split("\n")

          TestsDoc.configuration.logger.puts("DIFF: #{diff}")

          diff.size > 0
        else
          filtered_file_content != filtered_output
        end
      end

      def filtered_file_content
        @filtered_file_content ||= ::File.read(path).gsub(changes_whitelist, "")
      end

      def filtered_output
        @filtered_output       ||= output.gsub(changes_whitelist, "")
      end

      def ensure_folder
        dirname = ::File.dirname(path)
        unless ::File.directory?(dirname)
          ::FileUtils.mkdir_p(dirname)
        end
      end

      def changes_whitelist
        whitelist_option = if TestsDoc.configuration.changes_whitelist_regexes.any?
                             TestsDoc.configuration.changes_whitelist_regexes
                           else
                             TestsDoc.configuration.changes_whitelist_regex
                           end

        Regexp.union([whitelist_option, options[:whitelist]].flatten.compact)
      end

    # /private

  end

end
