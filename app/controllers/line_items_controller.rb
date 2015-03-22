class LineItemsController < ApplicationController

  before_action :set_cart, only: [:create]

  def create
    product_id = params[:line_item][:product_id]
    @line_item = @cart.add_product(product_id)
    
    respond_to do |format|

      if @line_item.save
        format.json {render json: {notice: 'Line item was successfully created'}}
      else
        format.json {render json: @line_item.errors,
status: :unprocessable_entity}
      end

    end
  end
end
