# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  asset      :string(255)
#  current_id :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :report do
    name "MyString"
asset "MyString"
current_id 1
  end

end
