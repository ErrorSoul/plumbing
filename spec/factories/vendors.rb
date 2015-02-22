# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :vendor do
    name 'MyString'
    country nil
  end
end
