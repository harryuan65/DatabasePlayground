thread_count = 4
seed_count = 40000

Benchmark.bm(7) do |x|
  x.report {
    threads = []

    thread_count.times.each do
      threads << Thread.new do
        Article.seed(seed_count/thread_count)
      end
    end

    threads.map(&:join)
  }
  x.report { Article.seed(seed_count) }
end

# 2x5000 vs 10000
# user     system      total        real
# 3.311565   0.354860   3.666425 (  4.447953)
# 4.855560   0.706313   5.561873 ( 10.717321)

# 4x10000 vs 40000
# user     system      total        real
# 8.875185   2.073469  10.948654 ( 11.105917)
# 18.087796   2.689053  20.776849 ( 44.062955)