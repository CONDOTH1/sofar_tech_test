class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :title, length: { minimum: 2 }, uniqueness: true
end
