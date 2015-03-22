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
#  text           :text
#  valuta_id      :integer
#  percent        :integer
#

class Model < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :vendor
  belongs_to :valuta
  has_many :products, inverse_of: :model
  #validates :name, :subcategory_id,  presence: true
  validates :text, presence: true

  scope :all_fetch, -> {includes(:vendor,:valuta, products: [variants: :option_type])}

  accepts_nested_attributes_for :products
  mount_uploader :asset, AssetUploader
end
