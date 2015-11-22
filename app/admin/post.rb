# -*- coding: utf-8 -*-

ActiveAdmin.register Post do
  permit_params :title, :body, :photo, :id
  index do
    selectable_column
    id_column
    column_creator([ :title, :body, :photo, :updated_at], aciton_flag=true)

  end


  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs t(:details) do
      f.input :title
      f.input :body, input_html: { class: 'redactor' }
       f.input :photo
    end
    f.actions
  end

   show do |x|
    attributes_table do

      row t(:id) do
        x.id
      end

      row t(:asset) do
        div class: 'thumb' do
          image_tag(x.photo.url)
        end
      end

      row t(:title) do
        x.title
      end

      row t(:body)  do
        x.body.html_safe
      end

      row t(:created_at) do
        x.created_at
      end


     end
  end
end
