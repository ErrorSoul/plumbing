# == Schema Information
#
# Table name: valuta
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Valuta < ActiveRecord::Base
  has_many :models
end
