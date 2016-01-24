# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  asset      :string(255)
#  current_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Report < ActiveRecord::Base

  has_many :tasks, dependent: :destroy

  mount_uploader :asset, AssetUploader

  def filename
    asset.file.path
  end

end
