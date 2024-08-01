module Fibonacci
  module MatrixIterative
    class << self
      def fibonacci(index)
        return index if index <= 1

        result = [1, 1, 1, 0]
        matrix = [1, 1, 1, 0]
        index -= 2 # Поскольку начинаем с Q^2

        while index.positive?
          result = matrix_multiply(result, matrix) if index.odd?
          matrix = matrix_multiply(matrix, matrix)
          index /= 2
        end

        result[0] # Возвращаем F(n+1), которое равно result[0]
      end

      private

      def matrix_multiply(a, b)
        [
          (a[0] * b[0]) + (a[1] * b[2]), (a[0] * b[1]) + (a[1] * b[3]),
          (a[2] * b[0]) + (a[3] * b[2]), (a[2] * b[1]) + (a[3] * b[3])
        ]
      end
    end
  end
end
