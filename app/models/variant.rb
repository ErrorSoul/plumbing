class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
  belongs_to :value, polymorphic: true
  accepts_nested_attributes_for :value
  accepts_nested_attributes_for :option_type


  def build_value(param)
    
    #pry.binding
    value_type = param[:value_type]
    self.value  = value_type.constantize.new(param.except(:value_type))
  end
  
end
