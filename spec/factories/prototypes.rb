# == Schema Information
#
# Table name: prototypes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  subcategory_id :integer
#

FactoryGirl.define do
  factory :prototype do
    name 'MyString'
    subcategory nil
  end
end
