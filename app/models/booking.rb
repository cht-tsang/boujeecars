class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :date, presence: true
  validates :car, presence: true
  validates :user, presence: true
end
