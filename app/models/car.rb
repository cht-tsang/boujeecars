class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :make, presence: true
  validates :model, presence: true
  validates :price, presence: true

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_make_and_model,
    against: [ :make, :model, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
