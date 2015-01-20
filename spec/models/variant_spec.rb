require 'rails_helper'

RSpec.describe Variant, :type => :model do
  before do 
    @variant = Variant.new(product_id: 1,
                           option_type_id: 1,
                           value_id: 1,
                           value_type: "VaraiantInt",
                           )
  end
  subject{@variant}
  
  %i(product_id option_type_id value_id value_type).each do |x|
    it {should respond_to(x)}
  end
  it {should be_valid}


  %i(product_id option_type_id value_id value_type).each do |x|
    describe "when #{x.to_s} is not present" do
      before {@variant.send("#{x}=", nil)}
        it {should be_invalid}
      end
  end
      

end
