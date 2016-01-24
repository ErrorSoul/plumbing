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

class Task < ActiveRecord::Base

  belongs_to :report
end
