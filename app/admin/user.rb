# -*- coding:utf-8 -*-
ActiveAdmin.register User do
  permit_params :name, :email, :user_type 

  filter :name, label: I18n.t(:name)
  filter :email, label: I18n.t(:email)
  filter :user_type, label: I18n.t(:state), as: :select, collection: User::TYPES.map{|x| [I18n.t(x), x]}

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


  index do
     selectable_column
     id_column

  column t(:name), :name do |x|
    link_to x.name, admin_user_path(x)
  end

  column t(:email), :email do |x|
      x.email
  end

  column t(:orders_sum), :email do |x|
      x.orders.count
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
      f.input :email
      f.input :user_type, label: t(:state), as: :select,
        collection: User::TYPES.map{|x| [I18n.t(x), x]}, include_blank: false
    end

    f.actions
  end

  show do |x|
    attributes_table do

      row t(:id) do
        x.id
      end

      row t(:name) do
        x.name
      end

      row t(:email)  do
        x.email
      end

      row t(:created_at) do
        x.created_at
      end

      row t(:orders_sum) do
        x.orders.count
      end
      
     end
  end

end
