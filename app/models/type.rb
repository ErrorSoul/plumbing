# == Schema Information
#
# Table name: types
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Type < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :option_types
end
