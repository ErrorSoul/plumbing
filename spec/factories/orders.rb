# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  address    :text
#  phone      :string(255)
#  total      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#

FactoryGirl.define do
  factory :order do
    user nil
address "MyText"
phone "MyString"
total "MyString"
  end

end
