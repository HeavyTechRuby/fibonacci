module Fibonacci
  module Loop
    def self.fibonacci(index)
      return index if index < 2

      prev2 = 0
      prev = 1
      current = nil

      (2..index).each do
        current = prev2 + prev

        prev2 = prev
        prev = current
      end

      current
    end
  end
end
