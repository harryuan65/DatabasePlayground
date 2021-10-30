ActiveRecord::Schema.define do
  create_table :articles, if_not_exists: true do |t| # Rails 6: https://www.bigbinary.com/blog/rails-6-adds-if_not_exists-option-to-create_table
    t.column :title, :string, null: false
    t.column :content, :text, default: '', null: false
    t.column :state, :string, default: 'published'
  end
end

class Article < ActiveRecord::Base
  ['published', 'archived'].each do |state_type|
    define_method "#{state_type}?" do |args|
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

