# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Type < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :option_types
end
