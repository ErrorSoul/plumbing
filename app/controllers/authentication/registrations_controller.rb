class Authentication::RegistrationsController < Devise::RegistrationsController
  require 'pry'
  include CurrentCart
  include SetModels
  before_action :set_need_attr
  before_action :set_cart
 
  respond_to   :json

  
end
