class VariantStr < ActiveRecord::Base
  validates :value, presence: true
end
