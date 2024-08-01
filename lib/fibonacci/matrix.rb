module Fibonacci
  module Matrix
    class << self
      def fibonacci(index)
        return index if index <= 1

        matrix_power([1, 1, 1, 0], index - 1)[0]
      end

      private

      def matrix_multiply(a, b)
        [
          (a[0] * b[0]) + (a[1] * b[2]), (a[0] * b[1]) + (a[1] * b[3]),
          (a[2] * b[0]) + (a[3] * b[2]), (a[2] * b[1]) + (a[3] * b[3])
        ]
        # c00 = (a[0] * b[0]) + (a[1] * b[2])
        # c01 = (a[0] * b[1]) + (a[1] * b[3])
        # c10 = (a[2] * b[0]) + (a[3] * b[2])
        # c11 = (a[2] * b[1]) + (a[3] * b[3])
        # [c00, c01, c10, c11]
      end

      def matrix_power(matrix, exponent)
        return [1, 0, 0, 1] if exponent.zero?
        return matrix if exponent == 1

        half = matrix_power(matrix, exponent / 2)
        result = matrix_multiply(half, half)
        exponent.odd? ? matrix_multiply(result, matrix) : result
      end
    end
  end
end
