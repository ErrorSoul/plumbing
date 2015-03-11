# -*- coding: utf-8 -*-

ActiveAdmin.register Category do
  permit_params :name, :text, :asset, subcategories_attributes: [:id, :name, :text, :asset, :category_id, :_destroy]

  index do
    selectable_column
    column_creator([:id, :name, :asset, :updated_at], action_flag = true)
  end

  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
      f.input :text
      f.input :asset
    end

    f.inputs "Contact", for: [:category,  Subcategory.new] do |b|  
      
        b.input :name, label: 'Название свойства'
        b.input :text
        b.input :asset

        b.has_many :models, allow_destroy: true, heading: "FFF" do |m|
          
          m.input :name, label: ApplicationHelper::DICT[:name]
          m.input :subcategory, label: 'Подкатегория', as: :select, collection: Subcategory.all, include_blank: false
          m.input :vendor, label: ApplicationHelper::DICT[:vendor], as: :select, collection: Vendor.all, include_blank: false
          m.input :text, label: ApplicationHelper::DICT[:text]
          m.input :asset, label: ApplicationHelper::DICT[:asset]
        
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

  sidebar 'Details', only: :show do
    attributes_table_for category do
      row :name
      category.subcategories.each do |x|
        row 'Podkategoriya' do
          x.name
        end
      end
    end
  end
end
