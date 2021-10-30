# bmbm: make rehersal first to compare when memo allocation could affect benchmark results
# Create an array of 1,000,000 random digits
array = (1..1000000).map { rand }

Benchmark.bmbm do |x|
  # Output the benchmark for sorting (destructive and non-destructive) the array
  x.report("sort!") { array.dup.sort! }
  x.report("sort")  { array.dup.sort  }
end