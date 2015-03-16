# -*- coding: utf-8 -*-
ActiveAdmin.register Model do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :asset, :text,  :subcategory_id, :name, :vendor_id, products_attributes: [:id, :asset, :subcategory_id, :model_id, :name, :description, :price, :marking, :value_type, :_destroy,  variants_attributes: [:id, :option_type_id, :product_id, :_destroy, value_attributes: [:id, :value, :value_type, :destroy]]]

  index do
    column_creator([:id, :name, :vendor, :asset, :updated_at], action_flag = true)
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form partial: 'x'
 

  show do |x|
    create_show(x, [:id, :name, :subcategory, :vendor, :text, :asset], d:
                { table_hash: { products: [:name, :asset] },
                  links_hash: { products: [:model_id, :subcategory_id] }

                })
  end

  sidebar I18n.t(:details), only: :show do
    attributes_table_for model do
      row t(:name) do |x|
        x.name
      end
      row t(:vendor) do |x|
        x.vendor.name
      end

      model.subcategory.prototype.option_types.each do |x|
        row 'Cвойство' do
          x.name
        end
      end
    end
  end
end
