class OptionType < ActiveRecord::Base
  belongs_to :type
  validates :name, :type_id,  presence: true
  validates :name, uniqueness: true
  has_many  :ptypes, class_name: "PrototypeOptionType", foreign_key: 'option_type_id', inverse_of: :option_type
  has_many :prototypes, through: :ptypes
  
  
end
