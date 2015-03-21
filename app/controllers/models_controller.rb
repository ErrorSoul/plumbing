class ModelsController < ApplicationController
before_action :set_need_attr

  def show
    @model = Model.all_fetch.find params[:id]
  end
end
