# == Schema Information
#
# Table name: models
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  subcategory_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  vendor_id      :integer
#  asset          :string(255)
#

require 'rails_helper'

RSpec.describe Model, type: :model do
  before do
    @model = Model.new(name: 'ROBOCOP',
                       subcategory_id: 1,
                       text: 'ahalahi mahalahi')
  end
  subject { @model }
  %i(name subcategory_id).each do |i|
    it { should respond_to(i) }
  end

  it { should be_valid }

  %i(name subcategory_id).each do |x|
    describe "when #{x} is not present" do
      describe "#{x} is nil" do
        before { @model.send("#{x}=", nil) }
        it { should be_invalid }
      end
    end
  end
end
