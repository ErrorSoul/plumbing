# == Schema Information
#
# Table name: variants
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  option_type_id :integer
#  value          :string(255)
#

class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
  belongs_to :value, polymorphic: true, dependent: :destroy
  default_scope { order('option_type_id ASC') }
 

  accepts_nested_attributes_for :value
  accepts_nested_attributes_for :option_type
 

  # http://stackoverflow.com/questions/3969025/accepts-nested-attributes-for-with-belongs-to-polymorphic
  def build_value(param)
    value_type = param[:value_type]
    self.value  = value_type.constantize.new(param.except(:value_type))
  end
end
