module Fibonacci
  module Object
    def self.fibonacci(index)
      numbers = Numbers.new

      numbers.take(index + 1)[-1]
    end

    class Numbers
      include Enumerable

      def each
        current = Number.new(0)

        loop do
          yield current.to_i

          current = current.next
        end
      end
    end

    class Number
      attr_reader :index

      def initialize(index, prev: 0, prev2: 0)
        @index = index
        @prev = prev
        @prev2 = prev2
      end

      def next
        Number.new index + 1, prev2: @prev, prev: to_i
      end

      def to_i
        return @index if @index < 2

        @prev + @prev2
      end
    end
  end
end
