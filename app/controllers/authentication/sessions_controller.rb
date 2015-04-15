class Authentication::SessionsController < Devise::SessionsController
  include CurrentCart
  include SetModels
  before_action :set_need_attr
  before_action :set_cart
  
  
  respond_to  :json

  prepend_before_filter :require_no_authentication, :only => [:create ]
  skip_before_filter    :authenticate_user!

  def create
  self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      respond_with resource, location: user_root_url
    end
  end
end



