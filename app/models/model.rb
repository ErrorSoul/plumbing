class Model < ActiveRecord::Base
  belongs_to :subcategory
  has_many :products, inverse_of: :model
  validates :name, :subcategory_id,  presence: true
end
