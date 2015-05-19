class UserMailer < ApplicationMailer

  def user_created(user)
    @scope = [:user_mailer, :user_created]
    @user  = user

    mail to: @user.email, subject: I18n.t(:user_created, scope: @scope)
  end

  def password_changed(user)
    @scope = [:user_mailer, :password_changed]
    @user  = user

    mail to: @user.email, subject: I18n.t(:password_changed, scope: @scope)
  end

end
