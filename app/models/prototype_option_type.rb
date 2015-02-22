# == Schema Information
#
# Table name: prototype_option_types
#
#  id             :integer          not null, primary key
#  prototype_id   :integer
#  option_type_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class PrototypeOptionType < ActiveRecord::Base
  belongs_to :prototype, inverse_of: :ptypes
  belongs_to :option_type,  inverse_of: :ptypes
  accepts_nested_attributes_for :option_type
end
