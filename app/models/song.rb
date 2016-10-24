class Song < ApplicationRecord
  validates :rating, inclusion: (1..5)
  belongs_to :artist
  belongs_to :city
  has_one :video, dependent: :destroy
end
