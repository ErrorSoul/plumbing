class MainPagesController < ApplicationController
  before_action :set_need_attr
  def index
    @categories ||= Category.includes(:subcategories).all
  end
end
