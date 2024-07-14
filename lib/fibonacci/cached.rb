module Fibonacci
  module Cached
    def self.fibonacci(index)
      Numbers.new.at(index)
    end

    class Numbers
      include Dependencies[:cache]

      def at(index)
        return index if index < 2

        cache.fetch(index - 1) { at(index - 1) } + cache.fetch(index - 2) { at(index - 2) }
      end
    end
  end
end
