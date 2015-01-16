require 'rails_helper'

RSpec.describe VariantStr, :type => :model do
  before do 
    @variant_str = VariantStr.new(value: "red")
  end

  subject { @variant_str }
  it {should respond_to(:value)}
  it {should be_valid}
  
  describe "when value is not present" do 
    before {@variant_str.value = nil}
    it {should be_invalid}
  end

end


