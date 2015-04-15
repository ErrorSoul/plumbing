# -*- coding: utf-8 -*-
ActiveAdmin.register Valuta do

  menu parent: "Дополнительно"
  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :name, :value
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do

    column "Название", :name do |x| 
      link_to x.name, admin_order_path(x)
    end

    column "Курс", :value  
    actions
  end


  show do |x|
    attributes_table do
      row "Название" do 
	x.name
      end
      row "Значение" do 
	x.value
      end
    end
  end
end
