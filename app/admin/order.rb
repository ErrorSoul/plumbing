# -*- coding:utf-8 -*-
ActiveAdmin.register Order do
  permit_params :user_id, :phone, :address, :state, :total 

  filter :user, label: I18n.t(:client)
  filter :phone, label: I18n.t(:phone)
  filter :address, label: I18n.t(:address)
  filter :created_at, label: I18n.t(:created_at)
  filter :state, label: I18n.t(:state), as: :select, collection: Order::STATES.map{|x| [I18n.t(x), x]}

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

  column t(:client), :name do |x|
    link_to x.user.name, admin_order_path(x)
    end
  column t(:phone), :phone do |x|
      x.phone
    end

  column t(:address), :address do |x|
      x.address
    end
  column t(:state), :state do |x|
      span class: status_label(x.state) do
        I18n.t x.state
      end
    end
    column t(:sum), :total
    column t(:total_r) do |x|
      x.calculator_rub
    end
    column t(:date_create), :created_at
  actions
  end


  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs t(:details) do
      f.input :state, label: t(:state), as: :select,
        collection: Order::STATES.map{|x| [I18n.t(x), x]}, include_blank: false
    end

    f.actions
  end
  show do |x|
    attributes_table do

      row t(:order_id) do
        x.id
      end

      row t(:client) do
        x.user
      end

      row t(:phone)  do
        x.phone
      end

      row t(:address) do
        x.address
      end

      row t(:sum) do
        x.total
      end

      row t(:total_r) do
        x.calculator_rub
      end

      row t(:created_at) do
        x.created_at
      end

      table_for x.line_items  do |z|
        column t(:product), :name  do |e|
          link_to e.product.name, [:admin, e.product]
        end

        column t(:asset), :asset do |e|
          div class: "thumb" do
            image_tag(e.product.asset.url)
          end
        end

        column "Количество", :quantity

        column "Цена товара" do |e|
          e.product.price
        end
      end

    end
  end

end
