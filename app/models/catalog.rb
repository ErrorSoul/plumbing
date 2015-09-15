class Catalog < ActiveRecord::Base
  validates :name, :asset,  presence: true

  mount_uploader :asset, AssetUploader
end
