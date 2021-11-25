class Court < ApplicationRecord
  has_one_attached :photo
  has_many :reservations
  belongs_to :user
  validates :name, :location, :pricing, :capacity, presence: true
end
