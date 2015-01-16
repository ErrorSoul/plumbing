class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
  belongs_to :value, polymorphic: true
  accepts_nested_attributes_for :value
end
