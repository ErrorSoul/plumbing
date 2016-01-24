# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  content        :text
#  report_id      :integer
#  remember_token :string(255)
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryGirl.define do
  factory :task do
    content "MyText"
report_id 1
remember_token "MyString"
status "MyString"
  end

end
