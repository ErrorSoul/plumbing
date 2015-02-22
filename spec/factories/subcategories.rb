# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :subcategory do
    name 'MyString'
    category nil
  end
end
