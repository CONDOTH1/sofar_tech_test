class Song < ApplicationRecord
  validates :rating, inclusion: (1..5)

end
