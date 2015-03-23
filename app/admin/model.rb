# -*- coding: utf-8 -*-
ActiveAdmin.register Model do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  
  config.clear_action_items!
  

  permit_params :id, :asset, :valuta_id, :text, :percent,  :subcategory_id, :name, :vendor_id, products_attributes: [:id, :asset, :subcategory_id, :model_id, :name, :description, :price, :marking, :value_type, :_destroy,  variants_attributes: [:id, :option_type_id, :product_id, :_destroy, value_attributes: [:id, :value, :value_type, :destroy]]]

  index do
    selectable_column
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
    create_show(x, [:id, :name, :subcategory, :vendor,:valuta, :percent, :text, :asset], d:
                { table_hash: { products: [:name, :asset] }
                  

                })

    if model.subcategory.prototype.present?
      a  I18n.t(:create_product), class: 'button', href: new_admin_product_path(product: { model_id: model.id,  subcategory_id: model.subcategory_id })
      
    end
  end

  sidebar I18n.t(:details), only: :show do
    attributes_table_for model do
      row t(:name) do |x|
        x.name
      end
      row t(:vendor) do |x|
        x.vendor.name
      end
      if model.subcategory.prototype.present?
        model.subcategory.prototype.option_types.each do |x|
          row 'Cвойство' do
            x.name
          end
        end
        a  I18n.t(:create_product), class: 'button', href: new_admin_product_path(product: { model_id: model.id,  subcategory_id: model.subcategory_id })
        
       
      end
    end
  end
end
