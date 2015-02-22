# == Schema Information
#
# Table name: variant_strs
#
#  id         :integer          not null, primary key
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VariantStr < ActiveRecord::Base
  validates :value, presence: true
  has_one :variant, as: :value
  has_many :products, through: :variant
end
