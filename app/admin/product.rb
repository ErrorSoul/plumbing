# -*- coding: utf-8 -*-
ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :id, :asset, :subcategory_id, :model_id, :name, :description, :price, :marking, :value_type,  variants_attributes: [:id, :option_type_id, value_attributes: [:id, :value, :value_type]]

  controller do
    def new
      # pry.binding
      @prot = Prototype.includes(option_types: :type).where('subcategory_id =?', params[:product][:subcategory_id]).first
      @product = Product.new(subcategory_id: params[:product][:subcategory_id],
                             model_id: params[:product][:model_id])
      for c in @prot.option_types

        @product.variants.build(option_type: c, value: c.type.name.eql?('INT') ? VariantInt.new : VariantStr.new)
      end
    end
  end

  index do
    selectable_column
    column_creator([:name, :asset, :marking], action_flag = true)
  end
  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name, label: t(:name)
      f.input :subcategory, label: t(:subcategory), as: :select, collection: Subcategory.all, include_blank: false
      f.input :model, label: t(:model), as: :select, collection: Model.all, include_blank: false
      f.input :asset, label: t(:asset)
      f.input :marking, label: t(:marking)
      f.input :price, label: t(:price)
      f.input :description, label: t(:description)
    end
    f.inputs do
      render 'variants', f: f
    end

    f.actions
  end

  show do |x|
    create_show_row(x, [:id, :name, :asset, :subcategory,
                        :model, :description, :marking, :variants], nil)
    attributes_table do
      row 'Создать' do
        link_to 'Новый продукт', new_admin_product_path(product: { subcategory_id: product.subcategory_id,
                                                                   model_id: product.model_id })
      end
    end
  end
end
