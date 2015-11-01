# -*- coding: utf-8 -*-

ActiveAdmin.register Catalog do
  permit_params :name,  :asset, :user_type, :id
  index do
    selectable_column
    id_column
    column  t(:name), :name do |obj|
      link_to(obj.name, admin_catalog_path(obj))
    end
    column  t(:asset), :asset do |obj|
      obj.asset.file.original_filename
    end
    column t(:user_type), :user_type do |x|
      span class: user_label(x.user_type) do
        I18n.t x.user_type
      end
    end
    actions

  end

  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs t(:details) do
      f.input :name
      f.input :asset
       f.input :user_type, label: t(:state), as: :select,
        collection: User::TYPES.map{|x| [I18n.t(x), x]}, include_blank: false
    end
    f.actions
  end

  show do |x|
    create_show(x, [:id, :name, :file, :user_type], d: {})
  end
end
