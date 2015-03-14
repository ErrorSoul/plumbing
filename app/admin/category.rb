# -*- coding: utf-8 -*-

ActiveAdmin.register Category do
  permit_params :name, :text, :asset, subcategories_attributes: [:id, :name, :text, :asset, :category_id, :_destroy ]

  index do
    selectable_column
    column_creator([:id, :name, :asset, :updated_at], action_flag = true)
  end

  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs t(:details) do
      f.input :name
      f.input :text
      f.input :asset
    end

    f.inputs t(:subcategories) do
      f.has_many :subcategories,  allow_destroy: true, heading: t(:names) do |b|
        
          b.input :name, label: t(:name)
          b.input :text
          b.input :asset
      end
    end
    f.actions
  end

  show do |x|
    create_show(x, [:id, :name, :asset, :text], d:
                { table_hash: { subcategories: [:name] },
                  links_hash: { subcategory: :category_id }
                })
  end

  sidebar I18n.t(:details), only: :show do
    attributes_table_for category do
      row :name
      category.subcategories.each do |x|
        row t(:subcategory) do
          link_to x.name, admin_subcategory_path(x)
        end
      end
    end
  end
end
