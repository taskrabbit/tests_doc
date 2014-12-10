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
        return true unless ::File.exists?(path)

        response_changed?
      end

      def response_changed?
        ::File.read(path).gsub(changes_whitelist, "") != output.gsub(changes_whitelist, "")
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
