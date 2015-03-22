class MainPagesController < ApplicationController
  before_action :set_need_attr
  before_action :set_cart

  def index
    @categories ||= Category.includes(:subcategories).all
  end

  def cart; end

end
