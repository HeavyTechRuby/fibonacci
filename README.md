# 10 способов релизовать Fibonacci

Реализовано в рамках стрима <https://www.youtube.com/watch?v=gYmNqF6bJJ4>

<div align="left">
  <a href="https://www.youtube.com/watch?v=gYmNqF6bJJ4">
    <img src="https://img.youtube.com/vi/gYmNqF6bJJ4/0.jpg" style="width:100%;">
  </a>
</div>

## Benchmark

```bash
$ make

Comparison:
with_class_varialble: 14094129.7 i/s
         memoization: 10714661.2 i/s - 1.32x  slower
           singleton:  5025901.4 i/s - 2.80x  slower
                loop:   695918.1 i/s - 20.25x  slower
           iterative:   695918.1 i/s - 22.35x  slower
          functional:   297923.1 i/s - 47.31x  slower
          fast_array:   286445.8 i/s - 49.20x  slower
                fast:   190578.0 i/s - 73.95x  slower
             adapter:   145293.1 i/s - 97.00x  slower
    cached in memory:   113326.2 i/s - 124.37x  slower
              object:    85734.6 i/s - 164.39x  slower
     cached in redis:     3471.4 i/s - 4060.12x  slower
recursive without memoization:     2059.7 i/s - 6842.93x  slower
               naive:       14.7 i/s - 956878.59x  slower
```

### Добавлены результаты тестирования с использованием матричного метода

```bash
$ ./benchmark_fibonacci.rb
Benchmark for size 1000:
Method               Time (s)    Slower by (%)   Slower by Times
matrix_iterative     0.000026                -                  -
matrix_with_lib      0.000069          165.38%              2.65x
matrix               0.000206          692.31%              7.92x
with_class_varialble 0.000281          980.77%             10.81x
singleton            0.000368         1315.38%             14.15x
memoization          0.000396         1423.08%             15.23x

Benchmark for size 10000:
Method               Time (s)    Slower by (%)   Slower by Times
matrix_with_lib      0.000147                -                  -
matrix_iterative     0.000425          189.12%              2.89x
matrix               0.002113         1337.41%             14.37x
with_class_varialble 0.004505         2964.63%             30.65x
singleton            0.005766         3822.45%             39.22x
memoization          0.008983         6010.88%             61.11x

Benchmark for size 100000:
Method               Time (s)    Slower by (%)   Slower by Times
matrix_with_lib      0.001497                -                  -
matrix_iterative     0.002834           89.31%              1.89x
matrix               0.003504          134.07%              2.34x
with_class_varialble 0.275290        18289.45%            183.89x

**Примечание:** 
- Результаты для `memoization` и `singleton` при размере 100_000 отсутствуют из-за переполнения стека.
- Для замеров использовалась стандартная библиотека Ruby 'benchmark'.
```
