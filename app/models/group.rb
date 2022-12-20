class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_users
end
