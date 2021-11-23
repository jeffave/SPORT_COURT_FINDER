class Court < ApplicationRecord
  has_many :reservations
  belongs_to :user
  validates :name, :location, :pricing, :capacity, presence: true
end
