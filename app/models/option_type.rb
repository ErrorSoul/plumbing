class OptionType < ActiveRecord::Base
  belongs_to :type
  validates :name, :type_id,  presence: true
  validates :name, uniqueness: true
  
end
