class MainPagesController < ApplicationController
  include CurrentCart
  include SetModels

  before_action :set_need_attr
  before_action :set_cart

  def index
    logger.info "FFFFFFFFFFFFFFFFFFFFF"
    @categories ||= Category.includes(:subcategories).all
  end

  def cart
    @user = User.new
  end

  def create
    @user = User.new params

    if @user.save
      redirect_to cart_path
    else
      redirect_to root_path
    end
  end
end
