# -*- coding: utf-8 -*-
ActiveAdmin.register Model do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :asset,  :subcategory_id, :name, :vendor_id

  index do 
    
    column_creator([:id, :name, :vendor, :asset, :updated_at], action_flag=true)
   
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

    form(:html => { :multipart => true }) do |f|
    
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name, label: ApplicationHelper::DICT[:name] 
      f.input :subcategory, label: "Подкатегория", :as => :select , :collection => Subcategory.all, include_blank: false
      f.input :vendor, label: ApplicationHelper::DICT[:vendor], :as => :select , :collection => Vendor.all, include_blank: false
      f.input :asset, label: ApplicationHelper::DICT[:asset] 
     
    end
    
   f.actions
  end

  show do |x|
    
    create_show(x, [:id, :name, :subcategory, :vendor, :asset], d: 
                {table_hash: {products: [:name, :asset]}, 
                  links_hash: {products: [:model_id, :subcategory_id]}
                              
                })
  end

  sidebar "Details", only: :show do
    attributes_table_for model do
      row :name
      row ApplicationHelper::DICT[:vendor] do |x|
        x.vendor.name
      end
        
        model.subcategory.prototype.option_types.each do |x|
          row "Cвойство" do 
            x.name
          end
        end
      end
    end
 
    
    
    

  

end
