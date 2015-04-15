class LineItemsController < ApplicationController
  include CurrentCart
  include SetModels
  before_action :set_cart, only: [:create, :show, :destroy, :update]
  skip_before_action :verify_authenticity_token, only: [:update]
  def show
    @line_item = LineItem.includes(product: [model: :valuta]).where('cart_id = ?', @cart.id)
    if @line_item.empty?
      render json: { message: t(:empty_cart) }
    else
      render json: { items: @line_item }, include: [{product: {include: {model: {include: {valuta: {only: :value}}}}}}] 
    end
  end

  def create
    product_id = params[:line_item][:product_id]
    @line_item = @cart.add_product(product_id)

    respond_to do |format|
      if @line_item.save
        format.json {
          render json: {
            line_size: @cart.total,
            notice: 'Line item was successfully created'
          }
        }
      else
        format.json {
          render json: @line_item.errors,
          status: :unprocessable_entity
        }
      end
    end
  end

  def update
    @list_update = params[:items]
    x = @list_update.map do |lin|
      if LineItem.find(lin[:id])
                 .update_attribute(:quantity, lin[:quantity])
        true
      else
        false
      end
    end
    if x.all?
      render json: { message: "Your line_item updated", line_size: @cart.total }
    else
      render json: { message: "something gone wrong" }
    end
  end

  def destroy
    @cart.line_items.destroy(params[:id])
    render json: { message: "Your post deleted", line_size: @cart.total }
  end

end
