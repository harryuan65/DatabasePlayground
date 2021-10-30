ActiveRecord::Schema.define do
  create_table :articles, if_not_exists: true do |t| # Rails 6: https://www.bigbinary.com/blog/rails-6-adds-if_not_exists-option-to-create_table
    t.column :title, :string, null: false
    t.column :content, :text, default: '', null: false
    t.column :state, :string, default: 'published'
    t.column :user_id, :integer
  end
end

class Article < ActiveRecord::Base
  belongs_to :user

  ['published', 'archived'].each do |state_type|
    define_method "#{state_type}?" do
      state == state_type
    end
  end

  class << self
    def seed(times)
      times.times.each do
        Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, state: %w(published archived).sample)
      end
    end
  end
end

# ActiveRecord::Base.connection.change_table :articles do |t|
#   t.column :user_id, :integer
# end
# Article.update_all("user_id=floor(random()*4000)::int")