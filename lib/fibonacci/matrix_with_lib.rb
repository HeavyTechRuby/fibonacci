require 'matrix' # Подключаем библиотеку matrix из стандартной библиотеки Ruby

module Fibonacci
  module MatrixWithLib
    FIBONACCI_MATRIX = ::Matrix[[1, 1], [1, 0]]

    def self.fibonacci(index)
      return index if index <= 1

      (FIBONACCI_MATRIX**(index - 1))[0, 0]
    end
  end
end
