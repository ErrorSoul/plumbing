class ModelsController < ApplicationController
include CurrentCart
include SetModels
before_action :set_need_attr
before_action :set_cart

  def show
    @model = Model.all_fetch.find params[:id]
  end
end
