# == Schema Information
#
# Table name: prototype_option_types
#
#  id             :integer          not null, primary key
#  prototype_id   :integer
#  option_type_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'rails_helper'

RSpec.describe PrototypeOptionType, type: :model do
  before do
    @p = PrototypeOptionType.new(prototype_id: 1,
                                 option_type_id: 1)
  end
  subject { @p }
  %i(prototype_id option_type_id).each do |x|
    it { should respond_to(x) }
  end

  it { should be_valid }

  %i(prototype_id option_type_id).each do |x|
    describe "when #{x} is not present" do
      before { @p.send("#{x}=", nil) }
      it { should be_valid }
    end
  end
end
