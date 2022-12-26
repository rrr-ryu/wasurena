class Attend < ActiveHash::Base
  self.data = [
    { id: 1, data: 'attendance' },
    { id: 2, data: 'absence' }
  ]
  include ActiveHash::Associations
  has_many :students
end
