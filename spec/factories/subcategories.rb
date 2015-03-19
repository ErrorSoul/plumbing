# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  text        :text
#  asset       :string(255)
#

FactoryGirl.define do
  factory :subcategory do
    name 'MyString'
    category nil
  end
end
