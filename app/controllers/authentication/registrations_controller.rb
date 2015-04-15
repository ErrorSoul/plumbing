class Authentication::RegistrationsController < Devise::RegistrationsController
  include CurrentCart
  include SetModels
  before_action :set_need_attr
  before_action :set_cart

  respond_to   :json

  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email,
               :password, :password_confirmation)
    end
  end
end
