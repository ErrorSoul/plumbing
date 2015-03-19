# == Schema Information
#
# Table name: categories
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  text  :text
#  asset :string(255)
#

class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :text, presence: true
  has_many :subcategories,   inverse_of: :category, dependent: :destroy
  accepts_nested_attributes_for :subcategories, allow_destroy: true
  
  mount_uploader :asset, AssetUploader
end
