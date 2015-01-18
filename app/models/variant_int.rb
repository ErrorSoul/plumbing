class VariantInt < ActiveRecord::Base
   validates :value, presence: true
   has_one :variant, as: :value
   has_many :products, through: :variant
end

