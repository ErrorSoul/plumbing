class Type < ActiveRecord::Base

  validates :name, uniqueness: true
  has_many :option_types
end
