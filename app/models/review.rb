class Review < ApplicationRecord
  belongs_to :restaurant
  validates_associated :restaurant
  validates :value, inclusion: 1..5 #incluido entre 1 e 5
end
