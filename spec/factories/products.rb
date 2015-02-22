# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  price          :decimal(8, 2)
#  marking        :string(255)
#  subcategory_id :integer
#  model_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#  asset          :string(255)
#

FactoryGirl.define do
  factory :product do
    name 'MyString'
    description 'MyText'
    price '9.99'
    marking 'MyString'
    subcategory nil
    model nil
  end
end
