# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vendor < ActiveRecord::Base
  belongs_to :country
  has_many :models
end
