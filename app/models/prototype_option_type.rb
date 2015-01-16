class PrototypeOptionType < ActiveRecord::Base
  belongs_to :prototype, inverse_of: :prototype_option_type
  belongs_to :option_type,  inverse_of: :prototype_option_type
  accepts_nested_attributes_for :option_type
end
