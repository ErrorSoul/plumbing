# == Schema Information
#
# Table name: variants
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  option_type_id :integer
#  value_id       :integer
#  value_type     :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryGirl.define do
  factory :variant do
    product nil
    option_type nil
    value nil
  end
end
