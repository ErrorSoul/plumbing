# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  quantity   :integer          default(1)
#  order_id   :integer
#

require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
