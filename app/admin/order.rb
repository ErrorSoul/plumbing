# -*- coding:utf-8 -*-
ActiveAdmin.register Order do
  

  filter :user, label: "Клиент"
  filter :phone, label: "Телефон"
  filter :address, label: "Aдрес"
  filter :created_at, label: "Дата создания"

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

  column "Клиент", :name do |x| 
    link_to x.user.name, admin_order_path(x)
    end
  column "Телефон", :phone do |x|
      x.phone 
    end

  column "Адрес", :address do |x| 
      x.address
    end

    column "Сумма", :total
  
    column "Принят", :created_at
  
  actions
  end


  show do |x|
    attributes_table do

      row "Номер Заказа" do 
	x.id
	end
      row "Клиент" do 
	x.user
	end	
      
      row "Телефон"  do
	x.phone
	end

      row "Адрес" do 
        x.address 
      end

      row "Сумма" do
        x.total
      end

      row "Дата создания" do 
        x.created_at
      end


      table_for x.line_items  do |z|
        
        
          column "Товар", :name  do |e|
            link_to e.product.name, [:admin, e.product]
          end
          column "Картинка", :asset do |e|
            div :class => "thumb" do
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
