ActiveRecord::Base.instance_eval do
  def show_columns
    columns.each_with_object({}) do |column, hash|
      hash[column.name] = column.sql_type_metadata.sql_type
    end
  end
end