# -*- coding: utf-8 -*-

# -*- coding: utf-8 -*-
ActiveAdmin.register Subcategory do
  permit_params :name, :category_id, :asset, :text,  models_attributes: [:id, :name, :_destroy]

  index do
    column_creator([:id, :name, :asset, :updated_at], action_flag = true)
  end

  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :category, label: 'Category', as: :select, collection: Category.all, include_blank: false
      f.input :name
      f.input :text
      f.input :asset
    end

    f.actions
  end

  show do |x|
    create_show(x, [:id, :name, :text, :asset,  :category], d:
                { table_hash: { prototype: [:name], models: [:name] },
                  links_hash: { }

                })

    button :fff
  end

  

  sidebar I18n.t('activerecord.models.prototype.one'), only: :show do |e|
    if subcategory.prototype.present?
      attributes_table_for subcategory do
        row t :name do |x|
          x.prototype.name
        end

        subcategory.prototype.option_types.each do |x|
          row t :attribute  do
            x.name
          end
        end
      end
    
    else
      link_to t('formtastic.create', model: t('activerecord.models.prototype.one')), 
              new_admin_prototype_path(prototype: {subcategory_id: subcategory.id}),
              class: 'button'
    end
  end

  sidebar I18n.t('activerecord.models.model.one'), only: :show do
    if subcategory.prototype.present?
      if subcategory.model.blank?
        link_to t('formtastic.create', model: t('activerecord.models.model.one')), 
              new_admin_model_path(model: {subcategory_id: subcategory.id}),
              class: 'button'
      end
    end
      
  end

  
end
