# 10 способов релизовать Fibonacci

Реализовано в рамках стрима <https://www.youtube.com/watch?v=gYmNqF6bJJ4>

<div align="left">
      <a href="https://www.youtube.com/watch?v=gYmNqF6bJJ4">
         <img src="https://img.youtube.com/vi/gYmNqF6bJJ4/0.jpg" style="width:100%;">
      </a>
</div>

## Benchmark

```
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

