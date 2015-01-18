class PrototypeOptionType < ActiveRecord::Base
  belongs_to :prototype, inverse_of: :ptypes
  belongs_to :option_type,  inverse_of: :ptypes
  accepts_nested_attributes_for :option_type
end
