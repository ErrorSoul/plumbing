class Product < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :model
  has_many :variants, inverse_of: :product
  accepts_nested_attributes_for :variants
  has_many :values_int, through: :variants, source: :value, source_type: "VariantInt"
  has_many :values_str, through: :variants, source: :value, source_type: "VariantStr"
end
