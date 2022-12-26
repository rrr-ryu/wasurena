class Student < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true

  belongs_to :room, foreign_key: 'room_id'
  belongs_to :team, optional: true
  belongs_to :pickup, optional: true
  belongs_to :ride, optional: true
  belongs_to :attend, optional: true
  has_one_attached :image
end
