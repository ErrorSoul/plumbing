require 'rails_helper'

RSpec.describe Type, :type => :model do
  before do 
    @type = Type.new(name: "INT")
  end
  subject { @type }

  it {should respond_to(:name)}
  it {should be_valid}


  describe "uniq" do 
    before  do 
      
      
      @type.save
      @wrong = Type.new
      @wrong.name = @type.name
      
    end

    it {@wrong.should  be_invalid}
  end
      
end
