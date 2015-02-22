class SubcategoriesController < ApplicationController
  before_action :set_need_attr
  def show 
    if params[:q].nil?
      @subcategory = Subcategory.includes(:products, models: :vendor)
        .find(params[:id])
    end
    
    @search = Subcategory.ransack params[:q]
    @subcategory ||= @search.result.includes(:products, models: :vendor).first
   
    @models = @subcategory.models.page(params[:page]).per(2)
  end
end
