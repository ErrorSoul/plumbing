# == Schema Information
#
# Table name: option_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class OptionType < ActiveRecord::Base
  belongs_to :type
  validates :name, :type_id,  presence: true
  validates :name, uniqueness: true
  default_scope { order('id ASC') }
  has_many :ptypes, class_name: 'PrototypeOptionType', foreign_key: 'option_type_id', inverse_of: :option_type
  has_many :prototypes, through: :ptypes
end
