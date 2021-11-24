class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :court
  validates :date, :end_date, presence: true
end
