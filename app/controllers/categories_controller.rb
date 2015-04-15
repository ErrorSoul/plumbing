class CategoriesController < ApplicationController
  include CurrentCart
  include SetModels
  before_action :set_need_attr
  before_action :set_cart

  def show
    @search = Subcategory.ransack params[:q]
    @category = @categories.select do |item|
      item.id == params[:id].to_i
    end.first
    @subcategories = @category.subcategories.includes(models: :vendor)
    @subcategories = @subcategories.page(params[:page]).per(25)
  end
end
