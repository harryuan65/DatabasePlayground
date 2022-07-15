# Demo: Single table inheritance

ActiveRecord::Schema.define do
  create_table :pets, if_not_exists: true do |t|
    t.string :name, null: false
    t.string :type, null: false # single table inheritance default column
    t.belongs_to :owner, foreign_key: {to_table: :users} # owner_id -> users.id
    t.timestamps
  end
end

class Pet < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  def make_sound = raise(NotImplementedError)

  def shake_hand = raise(NotImplementedError)
end

class Cat < Pet
  def make_sound
    "喵喵～"
  end

  def shake_hand
    "不要"
  end
end

class Dog < Pet
  def make_sound
    "汪汪！"
  end

  def shake_hand
    "開心地跟你握手"
  end
end
