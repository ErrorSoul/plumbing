require 'rails_helper'

RSpec.describe Product, :type => :model do
  before do 
    @product = Product.new(subcategory_id: 1,
                           model_id: 1)
  end
  subject {@product}
  %i(subcategory_id model_id variants values_int values_str).each do |x|
    it {should respond_to(x)}
  end

  %i(subcategory_id model_id).each do |x|
    describe "#{x} is nil" do 
        before {@product.send("#{x}=", nil)}
        it {should be_invalid}
      end
  end
    
end
