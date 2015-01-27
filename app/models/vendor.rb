class Vendor < ActiveRecord::Base
  belongs_to :country
  has_many :models
end
