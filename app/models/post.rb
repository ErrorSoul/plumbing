# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  photo      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  mount_uploader :photo, AssetUploader
  validates :title, :body, :photo,  presence: true

end
