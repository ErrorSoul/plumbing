# == Schema Information
#
# Table name: variant_ints
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe VariantInt, type: :model do
  before do
    @variant_int = VariantInt.new(value: 100)
  end

  subject { @variant_int }
  it { should respond_to(:value) }
  it { should be_valid }

  describe 'when value is not present' do
    before { @variant_int.value = nil }
    it { should be_invalid }
  end
end
