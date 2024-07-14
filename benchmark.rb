require 'benchmark/ips'

require_relative 'lib/fibonacci/naive'
require_relative 'lib/fibonacci/memoization'
require_relative 'lib/fibonacci/recursive_without_memoization'

Benchmark.ips do |x|
  # These parameters can also be configured this way
  x.time = 1
  x.warmup = 1

  # Typical mode, runs the block as many times as it can
  x.report('naive') { Fibonacci::Naive.fibonacci(20) }
  x.report('memoization') { Fibonacci::Memoization.fibonacci(20) }
  x.report('recursive without memoization') { Fibonacci::RecursiveWithoutMemoization.fibonacci(20) }

  # Compare the iterations per second of the various reports!
  x.compare!
end