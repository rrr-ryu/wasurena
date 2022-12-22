class Pickup < ApplicationRecord
  validates :name, presence: true, length: {maximum:10}

  belongs_to :room, foreign_key: "room_id"
  has_many :students
end
