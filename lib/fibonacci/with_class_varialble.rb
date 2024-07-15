module Fibonacci
  module WithClassVarialble
    @@list = [0, 1]

    def self.fibonacci(index)
      @@list[index] || fill_list(index) && @@list[index]
    end

    private

    def self.fill_list(index)
      (index - @@list.size + 1).times { @@list << @@list[-1] + @@list[-2] }
    end
  end
end
