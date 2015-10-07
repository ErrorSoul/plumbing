# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  user_type              :string(255)      default("user")
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many  :orders

  before_validation :put_password, on: :create
  after_create :send_mail_user_created
  #after_update :send_mail_password_changed

  private

  def put_password
    self.password = generate_password if self.password.nil?
  end


  def send_mail_user_created
    UserMailer.user_created(self).deliver
  end

  def generate_password
    [("a".."z"), (1..100), ("A".."Z")].map do |range|
      range.to_a.sample(3)
    end.shuffle.join.slice(0, 8)
  end
end
