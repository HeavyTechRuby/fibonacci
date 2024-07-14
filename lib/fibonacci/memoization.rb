module Fibonacci
  module Memoization
    def self.fibonacci(index)
      return index if index < 2

      @cached ||= {}

      @cached[index] ||= fibonacci(index - 2) + fibonacci(index - 1)
    end
  end
end
