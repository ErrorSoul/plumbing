# == Schema Information
#
# Table name: variants
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  option_type_id :integer
#  value          :string(255)
#

FactoryGirl.define do
  factory :variant do
    product nil
    option_type nil
    value nil
  end
end
