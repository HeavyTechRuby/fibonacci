module Fibonacci
  module Naive
    def self.fibonacci(index)
      return index if index < 2

      fibonacci(index - 2) + fibonacci(index - 1)
    end
  end
end
