# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  address    :text
#  phone      :string(255)
#  total      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#

require 'rails_helper'

RSpec.describe Order, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
