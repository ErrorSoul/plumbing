# == Schema Information
#
# Table name: prototype_option_types
#
#  id             :integer          not null, primary key
#  prototype_id   :integer
#  option_type_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryGirl.define do
  factory :prototype_option_type do
    prototype nil
    option_type nil
  end
end
