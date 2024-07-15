module Fibonacci
  class Adapter
    include Enumerable

    def initialize(name)
      @name = name
    end

    def each
      (0..).each do |index|
        yield engine.fibonacci(index)
      end
    end

    def fibonacci(index)
      engine.fibonacci(index)
    end

    def engine
      case @name
      when :naive
        require_relative 'naive'
        Naive
      when :fast
        require_relative 'fast'
        Fast
      else
        raise "Unknown engine name '#{@name}'"
      end
    end
  end
end
