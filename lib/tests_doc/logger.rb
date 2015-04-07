require 'fileutils'

module TestsDoc

  class Logger

    class << self

      def method_missing(method_name, *args)
        puts *args
      end

    end

  end

end
