class Model < ActiveRecord::Base
  belongs_to :subcategory
  validates :name, :subcategory_id,  presence: true
end
