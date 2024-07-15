require 'benchmark/ips'

require_relative 'dependencies'

require_relative 'lib/fibonacci/naive'
require_relative 'lib/fibonacci/memoization'
require_relative 'lib/fibonacci/recursive_without_memoization'
require_relative 'lib/fibonacci/fast'
require_relative 'lib/fibonacci/fast_array'
require_relative 'lib/fibonacci/singleton'
require_relative 'lib/fibonacci/cached'
require_relative 'lib/fibonacci/loop'
require_relative 'lib/fibonacci/object'
require_relative 'lib/fibonacci/functional'

Benchmark.ips do |x|
  # These parameters can also be configured this way
  x.time = 1
  x.warmup = 1

  NUMBER = 30
  MEMORY_CACHE = ActiveSupport::Cache::MemoryStore.new
  REDIS_CACHE = ActiveSupport::Cache::RedisCacheStore.new

  # Typical mode, runs the block as many times as it can
  x.report('naive') { Fibonacci::Naive.fibonacci(NUMBER) }
  x.report('memoization') { Fibonacci::Memoization.fibonacci(NUMBER) }
  x.report('recursive without memoization') { Fibonacci::RecursiveWithoutMemoization.fibonacci(NUMBER) }
  x.report('fast') { Fibonacci::Fast.fibonacci(NUMBER) }
  x.report('fast_array') { Fibonacci::FastArray.fibonacci(NUMBER) }
  x.report('singleton') { Fibonacci::Singleton.fibonacci(NUMBER) }
  x.report('cached in memory') { Fibonacci::Cached::Numbers.new(cache: MEMORY_CACHE).at(NUMBER) }
  x.report('cached in redis') { Fibonacci::Cached::Numbers.new(cache: REDIS_CACHE).at(NUMBER) }
  x.report('loop') { Fibonacci::Loop.fibonacci(NUMBER) }
  x.report('object') { Fibonacci::Object.fibonacci(NUMBER) }
  x.report('functional') { Fibonacci::Functional.fibonacci(NUMBER) }

  # Compare the iterations per second of the various reports!
  x.compare!
end
