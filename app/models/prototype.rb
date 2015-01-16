class Prototype < ActiveRecord::Base
  belongs_to :subcategory
  has_many  :ptypes, class_name: "PrototypeOptionType",  inverse_of: :prototype
  accepts_nested_attributes_for :ptypes
  has_many :option_types, through: :ptypes
end
