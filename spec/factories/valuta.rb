# == Schema Information
#
# Table name: valuta
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :valutum, :class => 'Valuta' do
    name "MyString"
value ""
  end

end
