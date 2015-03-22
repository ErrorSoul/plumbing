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

FactoryGirl.define do
  factory :model do
    name 'MyString'
    subcategory nil
  end
end
