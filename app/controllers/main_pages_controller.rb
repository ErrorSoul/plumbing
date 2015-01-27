class MainPagesController < ApplicationController

  def index

    @category = Category.includes(:subcategories => :models).all
    
  end
end
