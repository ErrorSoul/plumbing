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

require 'rails_helper'

RSpec.describe Valuta, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
