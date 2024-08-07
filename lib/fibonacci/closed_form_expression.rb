module Fibonacci
  module ClosedFormExpression
    # Алгоритм: https://en.wikipedia.org/wiki/Fibonacci_sequence#Closed-form_expression:~:text=article%3A%20Golden%20ratio-,Closed%2Dform%20expression,-%5Bedit%5D
    def self.fibonacci(n)
      sqrt5 = Math.sqrt(5)
      phi = (sqrt5 + 1) / 2

      (((phi**n) / sqrt5) + 0.5).to_i
    end
  end
end
