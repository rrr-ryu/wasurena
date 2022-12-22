class Student < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true

  belongs_to :room, foreign_key: "room_id"
  belongs_to :team, validate: false
  belongs_to :pickup, validate: false
end
