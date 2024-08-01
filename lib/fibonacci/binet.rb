module Fibonacci
  module Binet
    # Fibonacci numbers using Binet's formula
    # Необходимо учытывать, что формула Бине является приближенной и может давать ошибку на больших числах
    def self.fibonacci(index)
      sqrt5 = Math.sqrt(5)
      phi = (1 + sqrt5) / 2
      psi = (1 - sqrt5) / 2
      (((phi**index) - (psi**index)) / sqrt5).round
    end
  end
end
