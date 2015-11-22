class Post < ActiveRecord::Base

  mount_uploader :photo, AssetUploader
  validates :title, :body, :photo,  presence: true

end
