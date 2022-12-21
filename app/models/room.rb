class Room < ApplicationRecord
  validates :name, presence: true, length: {maximum:10}
  
  has_many :user_rooms
  has_many :users, through: :user_rooms
end
