class VariantInt < ActiveRecord::Base
   validates :value, presence: true
   has_many :variants, as: :value
   has_many :products, through: :variants
end
