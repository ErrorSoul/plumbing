class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include CurrentCart
  include SetModels
  

  before_action :set_need_attr
  before_action :set_cart
  def after_sign_in_path_for(resource)
    request.referrer
  end
end
