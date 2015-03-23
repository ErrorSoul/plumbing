# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  price          :decimal(8, 2)
#  marking        :string(255)
#  subcategory_id :integer
#  model_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#  asset          :string(255)
#

class Product < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :model

  has_many :variants, inverse_of: :product, dependent: :destroy
  has_many :option_types, through: :variants
  has_many :line_items

  accepts_nested_attributes_for :variants
  
  #validates :model_id, presence: true
  validates :marking, :description, :price, :name,  presence: true

  mount_uploader :asset, AssetUploader

  def p_price(model)
    m = price *  model.valuta.value
    m + (m * (model.percent/100.0))
  end
end
