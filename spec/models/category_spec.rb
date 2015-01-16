require 'rails_helper'


RSpec.describe Category, :type => :model do
  before do 
    @category = Category.new(name: "Engine")
  end

  subject { @category }
  it {should respond_to(:name)}
  it {should be_valid}
  
  describe "when name is not present" do 
    before {@category.name = nil}
    it {should be_invalid}
  end
end
