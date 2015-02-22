# == Schema Information
#
# Table name: variants
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  option_type_id :integer
#  value_id       :integer
#  value_type     :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
  belongs_to :value, polymorphic: true, dependent: :destroy
  default_scope { order('created_at DESC') }
  belongs_to :variant_int, foreign_key: :value_id
  
  #belongs_to :variant_int, -> { value(where(value_type: 'VariantInt')) }
  #scope :value_int, -> { where(value_type: ['VariantInt', 'VariantStr']) }

  accepts_nested_attributes_for :value
  accepts_nested_attributes_for :option_type
  # validates :product_id, :option_type_id, :value_id, :value_type, presence: true

  # http://stackoverflow.com/questions/3969025/accepts-nested-attributes-for-with-belongs-to-polymorphic
  def build_value(param)
    # pry.binding
    value_type = param[:value_type]
    self.value  = value_type.constantize.new(param.except(:value_type))
  end
end
