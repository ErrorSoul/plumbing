require 'rails_helper'

RSpec.describe Prototype, :type => :model do
  before do 
    @prototype = Prototype.new(subcategory_id: 1)
  end

  subject {@prototype}
  
  it {should respond_to(:subcategory_id)}
  it {should respond_to(:ptypes)}
  it {should respond_to(:option_types)}
  it {should respond_to(:name)}
  it {should be_valid}

  describe "when title is not present" do 
    before { @prototype.subcategory_id =  nil}
    it { should_not be_valid }
  end
  describe "when name  is not present" do 
    before { @prototype.name =  nil}
    it { should_not be_valid }
  end
  
end
