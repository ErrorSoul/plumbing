# == Schema Information
#
# Table name: variants
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  option_type_id :integer
#  value          :string(255)
#

require 'rails_helper'

RSpec.describe Variant, type: :model do
  before do
    @variant = Variant.new(product_id: 1,
                           option_type_id: 1,
                           value_id: 1,
                           value_type: 'VaraiantInt'
                           )
  end
  subject { @variant }

  %i(product_id option_type_id value_id value_type).each do |x|
    it { should respond_to(x) }
  end
  it { should be_valid }

  %i(product_id option_type_id value_id value_type).each do |x|
    describe "when #{x} is not present" do
      before { @variant.send("#{x}=", nil) }
      it { should be_valid }
    end
  end
end
