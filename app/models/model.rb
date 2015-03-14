# == Schema Information
#
# Table name: models
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  subcategory_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  vendor_id      :integer
#  asset          :string(255)
#

class Model < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :vendor
  has_many :products, inverse_of: :model
  #validates :name, :subcategory_id,  presence: true
  validates :text, presence: true
  mount_uploader :asset, AssetUploader
end
