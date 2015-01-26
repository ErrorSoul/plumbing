require 'rails_helper'

RSpec.describe Subcategory, :type => :model do
  before do 
    @subcategory = Subcategory.new(name: "Terminators",
                                   category_id: 1)
  end

  subject { @subcategory }

  it {should respond_to(:name)}
  it {should respond_to(:category_id)}
  %i(prototype products models).each do |i|
    it {should respond_to(i)}
  end

  it {should be_valid}

   describe "when name is not present" do 
    before { @subcategory.name =  " "}
    it { should_not be_valid }
  end

  describe "when category_id is not present" do 
    before { @subcategory.category_id = nil }
    it { should be_invalid }
  end

  
end