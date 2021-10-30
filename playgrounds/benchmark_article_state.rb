Benchmark.bm(10) do |x|
  x.report('published') { Article.select(:title, :content).where(state: 'published').where("user_id >= 2000") }
  x.report('archived') { Article.select(:title, :content).where(state: 'archived').where("user_id < 2000") }
end

# articles: 201100 rows
#               user      system      total        real
# published  0.000339   0.000341   0.000680 (  0.000675)
# archived   0.000102   0.000001   0.000103 (  0.000104)

ActiveRecord::Base.connection.exec_query("explain analyze SELECT \"articles\".\"title\", \"articles\".\"content\" FROM \"articles\" WHERE \"articles\".\"state\" = 'archived' AND (user_id < 2000)").rows.join("\n")
# Seq Scan on articles  (cost=0.00..17095.50 rows=51156 width=231) (actual time=0.230..52.708 rows=50080 loops=1)
#   Filter: ((user_id < 2000) AND ((state)::text = 'archived'::text))
#   Rows Removed by Filter: 151020
# Planning Time: 0.122 ms
# Execution Time: 54.777 ms