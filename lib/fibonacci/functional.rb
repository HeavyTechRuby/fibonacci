module Fibonacci
  module Functional
    def self.fibonacci(index)
      list(index)[-1]
    end

    def self.list(index)
      return [0] if index.zero?
      return [0, 1] if index == 1

      head = list(index - 1)

      head + [head[index - 2] + head[index - 1]]
    end
  end
end
