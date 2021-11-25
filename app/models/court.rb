class Court < ApplicationRecord
  has_many :reservations
  belongs_to :user
  validates :name, :location, :pricing, :capacity, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
