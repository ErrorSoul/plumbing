class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_one :prototype
  has_many :products
  has_many :models
  validates :name, :category_id, presence: true
  
end
