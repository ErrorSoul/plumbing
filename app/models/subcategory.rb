class Subcategory < ActiveRecord::Base
  belongs_to :category, inverse_of: :subcategories
  has_one :prototype
  has_many :products
  has_many :models
  validates :name,  presence: true
  
end
