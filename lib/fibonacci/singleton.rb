require 'singleton'

module Fibonacci
  module Singleton
    def self.fibonacci(index)
      Numbers.instance.at(index)
    end

    class Numbers
      include ::Singleton

      def initialize
        @cache = {}
      end

      def at(index)
        return index if index < 2

        @cache[index - 2] ||= at(index - 2)
        @cache[index - 1] ||= at(index - 1)

        @cache[index - 1] + @cache[index - 2]
      end
    end
  end
end
