class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :product_categories
  has_many :orders
  has_many :reviews
  validates_associated :category
  #se esses nomes não estiverem presentes, n roda
validates :name, presence: true
validates :status, presence: true
validates :delivery_tax, presence: true
validates :city, presence: true
validates :street, presence: true

enum status: {closed: 0, open:1} #closed é 0 e open é 1 no status

has_one_attached :image

geocoded_by :address
 
after_validation :geocode
 
def address
  [street, number, city, state].compact.join(', ')
end

end
