Benchmark.bm do |x|
  x.report { Article.select(:title, :content).where(state: 'published').count }
  x.report { Article.select(:title, :content).where(state: 'archived').count }
end