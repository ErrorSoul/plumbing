# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  photo      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :post do
    title "MyString"
photo "MyString"
body "MyText"
  end

end
