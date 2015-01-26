class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :subcategories,   inverse_of: :category, dependent: :destroy
  accepts_nested_attributes_for :subcategories, allow_destroy: true
end
