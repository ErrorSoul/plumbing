# == Schema Information
#
# Table name: variant_ints
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

class VariantInt < ActiveRecord::Base
  validates :value, presence: true

  has_one :variant, as: :value
  has_many :products, through: :variant

  
end
