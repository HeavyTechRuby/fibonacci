require 'bigdecimal'
require 'bigdecimal/math'

module Fibonacci
  module BinetWithMath
    include BigMath

    # Fibonacci numbers using Binet's formula with high precision
    # Высокая точность вычисления чисел Фибоначчи с использованием формулы Бине, одгако низакая производительность
    def self.fibonacci(index)
      precision = 100 # Установка уровня точности для вычислений

      # Используем BigDecimal для высокой точности арифметических операций
      sqrt5 = BigDecimal('5').sqrt(precision)
      phi = (BigDecimal('1') + sqrt5) / BigDecimal('2')
      psi = (BigDecimal('1') - sqrt5) / BigDecimal('2')

      # Вычисление n-го числа Фибоначчи и округление до ближайшего целого
      (((phi**index) - (psi**index)) / sqrt5).round
    end
  end
end
