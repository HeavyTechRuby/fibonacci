module Fibonacci
  module Fast
    def self.fibonacci(index, cache = {})
      return index if index < 2

      cache[index - 1] ||= fibonacci(index - 1, cache)
      cache[index - 2] ||= fibonacci(index - 2, cache)

      cache[index - 1] + cache[index - 2]
    end
  end
end
