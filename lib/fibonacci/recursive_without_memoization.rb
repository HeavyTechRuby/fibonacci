module Fibonacci
  module RecursiveWithoutMemoization
    def self.fibonacci(index, prev = nil)
      return index if index < 2

      prev2 = fibonacci(index - 2)
      prev ||= fibonacci(index - 1, prev2)

      prev2 + prev
    end
  end
end
