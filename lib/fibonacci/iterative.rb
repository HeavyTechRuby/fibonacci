module Fibonacci
  module Iterative
    def self.fibonacci(n, x = 0, y = 1)
      return x if n == 0

      fibonacci(n - 1, y, x + y)
    end
  end
end
