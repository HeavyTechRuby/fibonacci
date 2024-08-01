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
  sizes = [1_000, 10_000, 100_000] # Ограничим тестирование до 10,000 для методов, использующих рекурсию
  all_results = {}

  sizes.each do |size|
    results = []
    puts "Benchmark for size #{size}:"
    results << ['memoization', Benchmark.realtime { Fibonacci::Memoization.fibonacci(size) }] unless size > 10_000
    results << ['singleton', Benchmark.realtime { Fibonacci::Singleton.fibonacci(size) }] unless size > 10_000
    results << ['with_class_varialble', Benchmark.realtime { Fibonacci::WithClassVarialble.fibonacci(size) }]
    results << ['matrix', Benchmark.realtime { Fibonacci::Matrix.fibonacci(size) }]
    results << ['matrix_iterative', Benchmark.realtime { Fibonacci::MatrixIterative.fibonacci(size) }]
    results << ['matrix_with_lib', Benchmark.realtime { Fibonacci::MatrixWithLib.fibonacci(size) }]

    all_results[size] = results.sort_by { |_, time| time }
  end

  max_name_length = all_results.values.flatten(1).map { _1[0].length }.max

  all_results.each do |size, results|
    fastest_time = results.first.last

    puts "\nBenchmark results for size #{size}:"
    puts "#{'Method'.ljust(max_name_length)} Time (s)    Slower by (%)   Slower by Times"
    results.each do |method, time|
      slower_by_percent = time == fastest_time ? '-' : "#{((time - fastest_time) / fastest_time * 100).round(2)}%"
      slower_by_times = time == fastest_time ? '-' : "#{(time / fastest_time).round(2)}x"
      puts "#{method.ljust(max_name_length)} #{format('%0.6f',
                                                      time)}  #{slower_by_percent.rjust(15)}  #{slower_by_times.rjust(17)}"
    end
  end
end

benchmark_fibonacci
