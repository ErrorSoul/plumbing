
class Subcategory < ActiveRecord::Base
  belongs_to :category, inverse_of: :subcategories
  has_one :prototype, inverse_of: :subcategory, dependent: :destroy
  has_many :products, inverse_of: :subcategory
  has_many :models, inverse_of: :subcategory, dependent: :destroy
  has_many :vendors, through: :models
  accepts_nested_attributes_for :prototype, :models,   allow_destroy: true
  validates :name,  presence: true
  
end

