# -*- coding: utf-8 -*-

ActiveAdmin.register Catalog do
  permit_params :name,  :asset, :id
  index do
    selectable_column
    id_column
    column  t(:name), :name do |obj|
      link_to(obj.name, admin_catalog_path(obj))
    end
    column  t(:asset), :asset do |obj|
      obj.asset.file.original_filename
    end
    actions

  end

  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs t(:details) do
      f.input :name
      f.input :asset
    end
    f.actions
  end

  show do |x|
    create_show(x, [:id, :name, :file], d: {})
  end
end
