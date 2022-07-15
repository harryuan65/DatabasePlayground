ActiveRecord::Schema.define do
  create_table :users, if_not_exists: true do |t|
    t.column :name, :string, null: false
    t.column :email, :string, null: false
    t.column :points, :integer, null: false, default: 0
    t.timestamps
  end
end

class User < ActiveRecord::Base
  has_many :articles
  has_many :pets, foreign_key: "owner_id"

  class << self
    def seed(times)
      times.times.each do
        User.create!(name: Faker::Name.name, email: Faker::Internet.email)
      end
    end
  end
end
