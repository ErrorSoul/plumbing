class ProductsController < ApplicationController
  before_action :set_need_attr
  before_action :set_cart
  def new
    @prot = Prototype.includes(option_types: :type).first
    @product = Product.new
    for c in @prot.option_types

      @product.variants.build(option_type: c, value: c.type.name.eql?('INT') ? VariantInt.new : VariantStr.new)
    end

    # pry.binding
  end

  def show
    @product = Product.find(params[:id])
    @models = (@product.subcategory.models - [@product.model]).take(3)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @product
    else
      @product = @product.errors.messages
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price,
                                    :description, :marking,
                                    variants_attributes: [
                                      :option_type_id,
                                      value_attributes: [:value, :value_type]
                                    ]
                                    )
  end
end
