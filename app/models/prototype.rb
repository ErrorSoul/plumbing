# == Schema Information
#
# Table name: prototypes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  subcategory_id :integer
#

class Prototype < ActiveRecord::Base
  belongs_to :subcategory, inverse_of: :prototype
  has_many :ptypes, class_name: 'PrototypeOptionType',  inverse_of: :prototype, dependent: :destroy
  accepts_nested_attributes_for :ptypes, allow_destroy: true
  has_many :option_types, through: :ptypes
  validates :name,  presence: true
  # before_create :check_single

  private

  def check_single
    b = Prototype.where('subcategory_id=?', subcategory_id)
    if b.length > 0
      errors.add(:single, 'should be one examle')
    else
      save
    end
  end
end
