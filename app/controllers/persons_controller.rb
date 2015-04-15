class PersonsController < ApplicationController
  before_filter :authenticate_user!
  include CurrentCart
  include SetModels
  before_action :set_cart
  before_action :set_need_attr

  def profile
  end
end
