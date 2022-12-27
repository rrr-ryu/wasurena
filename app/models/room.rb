class Room < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }

  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms
  has_one :team, dependent: :destroy
  has_one :pickup, dependent: :destroy
  has_one :student, dependent: :destroy
end
