# -*- coding: utf-8 -*-
ActiveAdmin.register Prototype do
   permit_params :id, :name, :subcategory_id, ptypes_attributes: [:option_type_id, :_destroy, :id]

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
    column_creator([:id, :name, :updated_at], action_flag=true)
  end
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :subcategory , label: "Subcategory", :as => :select , :collection => Subcategory.all, include_blank: false
      f.input :name
      
    end
    
    f.inputs  do
      f.has_many :ptypes,  allow_destroy: true, heading:
      "Характеристики" do |b|
       
          b.input :option_type, label: "Название свойства", :as => :select , :collection => OptionType.all,  include_blank: false

          
        
      end
    end
   
    
   
   
   
    
    f.actions
  end
  show do |x|
    create_show(x, [:id, :name, :subcategory], d: 
                {table_hash: {option_types: [:name]}, 
                  links_hash: nil
                              
                })
  end


end
