# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  content        :text
#  report_id      :integer
#  remember_token :string(255)
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'rails_helper'

RSpec.describe Task, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
