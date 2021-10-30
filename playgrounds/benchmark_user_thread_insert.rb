thread_count = 4
seed_count = 4000

Benchmark.bm(7) do |x|
  x.report('4x1000') {
    threads = []

    thread_count.times.each do
      threads << Thread.new do
        User.seed(seed_count/thread_count)
      end
    end

    threads.map(&:join)
  }
  x.report('4000') { User.seed(seed_count) }
end

#             user     system      total        real
# 4x1000  5.159839   0.337219   5.497058 (  5.655065)
# 4000    3.557532   0.198453   3.755985 (  6.454438)