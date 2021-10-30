@sql = <<-SQL
  create table if not exists articles(id serial primary key, title varchar(256), content text, state varchar(32));
SQL

ActiveRecord::Base.connection.exec_query(@sql)
# => #<ActiveRecord::Result:0x0000000127076ed0 @column_types={}, @columns=[], @hash_rows=nil, @rows=[]>

ActiveRecord::Base.connection.execute(@sql)
# => #<PG::Result:0x000000012703c0f0 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=0>