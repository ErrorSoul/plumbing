# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  asset      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_type  :string(255)
#

FactoryGirl.define do
  factory :catalog do
    name "MyString"
asset "MyString"
  end

end
