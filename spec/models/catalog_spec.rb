# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  asset      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_type  :string(255)
#

require 'rails_helper'

RSpec.describe Catalog, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
