class Product < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :model
  has_many :variants, inverse_of: :product, dependent: :destroy
  has_many :option_types, through: :variants
  accepts_nested_attributes_for :variants
  has_many :values_int, through: :variants, source: :value, source_type: "VariantInt"
  has_many :values_str, through: :variants, source: :value, source_type: "VariantStr"

  validates :subcategory_id, :model_id, presence: true
  validates :marking, :description, :price, :name,  presence: true

  mount_uploader :asset, AssetUploader
end
