# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  name       :string(255)
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :comment do
    body "MyText"
name "MyString"
product nil
  end

end
