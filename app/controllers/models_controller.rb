class ModelsController < ApplicationController
before_action :set_need_attr

  def show
    @model = Model.includes(:vendor, products: [variants: :value]).find params[:id]
  end
end
