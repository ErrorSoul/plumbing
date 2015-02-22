
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
                  links_hash: { prototype: :subcategory_id, model: :subcategory_id }

                })
  end
end
