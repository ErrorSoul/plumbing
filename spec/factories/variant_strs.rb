# == Schema Information
#
# Table name: variant_strs
#
#  id         :integer          not null, primary key
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :variant_str do
    value 'MyString'
  end
end
