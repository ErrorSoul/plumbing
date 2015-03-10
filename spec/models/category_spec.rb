# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = Category.new(name: 'Engine',
                             text:  "Ahalai Mahalai")
  end

  subject { @category }
  it { should respond_to(:name) }
  it { should be_valid }

  describe 'when name is not present' do
    before { @category.name = nil }
    it { should be_invalid }
  end
end
