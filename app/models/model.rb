class Model < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :vendor
  has_many :products, inverse_of: :model
  validates :name, :subcategory_id,  presence: true
  mount_uploader :asset, AssetUploader
  
end
