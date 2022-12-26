class Ride < ActiveHash::Base
  self.data = [
    { id: 1, data: 'rideOn' },
    { id: 2, data: 'rideOff' }
  ]
  include ActiveHash::Associations
  has_many :students
end
