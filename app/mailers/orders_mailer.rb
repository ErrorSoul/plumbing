class OrdersMailer < ApplicationMailer

  def send_client(order)
    @order = order
    @user  = @order.user
    mail to: @user.email, subject: I18n.t(:send_client_order)
  end

  def send_shop(order)
    @order = order
    @user  = @order.user
    mail to: "neurofag@gmail.com", subject: I18n.t(:send_client_order)
  end
end
