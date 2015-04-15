class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #include CurrentCart
  #include SetModels
  #before_action :set_cart
  #before_action :set_need_attr
end
