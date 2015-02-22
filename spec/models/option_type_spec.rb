# == Schema Information
#
# Table name: option_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe OptionType, type: :model do
  before do
    @option_type = OptionType.new(name: 'Power',
                                  type_id: 1)
  end

  subject { @option_type }
  %i(name type_id).each do |i|
    it { should respond_to(i) }
  end
  it { should be_valid }

  describe 'when attr not present' do
    %i(name type_id).each  do  |x|
      describe "#{x} is nil" do
        before { @option_type.send("#{x}=", nil) }
        it { should be_invalid }
      end
    end
  end

  describe 'uniq' do
    before do
      @option_type.save
      @wrong = OptionType.new(type_id: 1)
      @wrong.name = @option_type.name
    end
    it { @wrong.should be_invalid }
  end
end
