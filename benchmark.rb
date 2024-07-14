require 'benchmark/ips'

require_relative 'lib/fibonacci/naive'
require_relative 'lib/fibonacci/memoization'

Benchmark.ips do |x|
  # These parameters can also be configured this way
  x.time = 5
  x.warmup = 2

  # Typical mode, runs the block as many times as it can
  x.report('naive') { Fibonacci::Naive.fibonacci(20) }
  x.report('memoization') { Fibonacci::Memoization.fibonacci(20) }

  # Compare the iterations per second of the various reports!
  x.compare!
end
