#!/usr/bin/env ruby

require 'benchmark'
require 'matrix'

require_relative 'lib/fibonacci/memoization'
require_relative 'lib/fibonacci/singleton'
require_relative 'lib/fibonacci/with_class_varialble'
require_relative 'lib/fibonacci/matrix'
require_relative 'lib/fibonacci/matrix_iterative'
require_relative 'lib/fibonacci/matrix_with_lib'

def benchmark_fibonacci
  sizes = [1_000, 10_000, 100_000] # Ограничим тестирование до 10,000
  results = {}

  sizes.each do |size|
    results[size] = []
    results[size] << ['memoization', Benchmark.realtime { Fibonacci::Memoization.fibonacci(size) }] unless size > 10_000
    results[size] << ['singleton', Benchmark.realtime { Fibonacci::Singleton.fibonacci(size) }] unless size > 10_000
    results[size] << ['with_class_varialble', Benchmark.realtime { Fibonacci::WithClassVarialble.fibonacci(size) }]
    results[size] << ['matrix', Benchmark.realtime { Fibonacci::Matrix.fibonacci(size) }]
    results[size] << ['matrix_iterative', Benchmark.realtime { Fibonacci::MatrixIterative.fibonacci(size) }]
    results[size] << ['matrix_with_lib', Benchmark.realtime { Fibonacci::MatrixWithLib.fibonacci(size) }]
  end

  results.each do |size, benchmarks|
    sorted_benchmarks = benchmarks.sort_by { |_, time| time }
    fastest_time = sorted_benchmarks.first.last

    puts "\nBenchmark results for size #{size}:"
    sorted_benchmarks.each do |method, time|
      if time == fastest_time
        puts "#{method}: Fastest"
      else
        slower_by = ((time - fastest_time) / fastest_time * 100).round(2)
        puts "#{method}: #{slower_by}% slower than the fastest"
      end
    end
  end
end

benchmark_fibonacci
