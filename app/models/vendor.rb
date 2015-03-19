# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#

class Vendor < ActiveRecord::Base
  belongs_to :country
  has_many :models
end
