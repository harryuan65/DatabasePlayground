class ActiveRecord::Base
  def show_column
    columns.each_with_object({}) do |column, hash|
      hash[column.name] = column.sql_type_metadata.sql_type
    end
  end
end