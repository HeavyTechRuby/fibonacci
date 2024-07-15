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
         memoization: 10155023.3 i/s
           singleton:  4926425.3 i/s - 2.06x  slower
                loop:   684707.5 i/s - 14.83x  slower
          functional:   294752.1 i/s - 34.45x  slower
          fast_array:   282805.5 i/s - 35.91x  slower
                fast:   188347.2 i/s - 53.92x  slower
             adapter:   145992.8 i/s - 69.56x  slower
    cached in memory:   112341.9 i/s - 90.39x  slower
              object:    85781.4 i/s - 118.38x  slower
     cached in redis:     3338.6 i/s - 3041.70x  slower
recursive without memoization:     2032.5 i/s - 4996.21x  slower
               naive:       14.5 i/s - 700161.57x  slower
```
