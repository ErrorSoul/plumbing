# == Schema Information
#
# Table name: variant_ints
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :variant_int do
    value 1
  end
end
