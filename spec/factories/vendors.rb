# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#

FactoryGirl.define do
  factory :vendor do
    name 'MyString'
    country nil
  end
end
