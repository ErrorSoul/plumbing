# -*- coding: utf-8 -*-

ActiveAdmin.register Category do 
  
  
  permit_params :name, subcategories_attributes: [:id, :name, :category_id, :_destroy]
  
  index do |e|
    
   
    column_creator([ :id, :name, :updated_at],action_flag=true)
    
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
      
    end
    
    f.inputs  do
      f.has_many :subcategories,  allow_destroy: true, heading: "Подкатегории" do |b|
        b.input :name, :label => "Имя подкатегории" 
        
      end
    end
   
    
    f.actions
  end

  show do |x|
    create_show(x, [:id, :name], d: 
                {table_hash: {subcategories: [:id, :name] }, 
                  links_hash: {subcategory: :category_id}
                })
  end

end
