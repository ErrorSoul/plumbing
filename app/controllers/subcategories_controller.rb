class SubcategoriesController < ApplicationController
  before_action :set_need_attr
  def show 
    if params[:q].nil?
      @subcategory = Subcategory.all_fetch.find(params[:id])
      @models = @subcategory.models
    end
    
    @search = Subcategory.ransack params[:q]
    @subcategory ||= @search.result.all_vendors.first
    name = params[:q][:models_vendor_name_cont] if params[:q]
    @models ||= Model.all_fetch.where('vendors.name = ? and models.subcategory_id= ?',name, @subcategory.id).references(:vendor)
    
    @models = @models.page(params[:page]).per(2)
    
  end
end
