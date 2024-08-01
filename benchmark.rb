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
require_relative 'lib/fibonacci/adapter'
require_relative 'lib/fibonacci/with_class_varialble'
require_relative 'lib/fibonacci/iterative'
require_relative 'lib/fibonacci/closed_form_expression'
require_relative 'lib/fibonacci/matrix'
require_relative 'lib/fibonacci/matrix_iterative'
require_relative 'lib/fibonacci/matrix_with_lib'
require_relative 'lib/fibonacci/binet'

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
  x.report('adapter') { Fibonacci::Adapter.new(:fast).fibonacci(NUMBER) }
  x.report('with_class_varialble') { Fibonacci::WithClassVarialble.fibonacci(NUMBER) }
  x.report('iterative') { Fibonacci::Iterative.fibonacci(NUMBER) }
  x.report('closed_form_expression') { Fibonacci::ClosedFormExpression.fibonacci(NUMBER) }
  x.report('matrix') { Fibonacci::Matrix.fibonacci(NUMBER) }
  x.report('matrix with iterative') { Fibonacci::MatrixIterative.fibonacci(NUMBER) }
  x.report("matrix with ruby lib 'matrix'") { Fibonacci::MatrixWithLib.fibonacci(NUMBER) }
  x.report("Binet's formula") { Fibonacci::Binet.fibonacci(NUMBER) }
  x.report("Binet's formula with math lib") { Fibonacci::BinetWithMath.fibonacci(NUMBER) }

  # Compare the iterations per second of the various reports!
  x.compare!
end
