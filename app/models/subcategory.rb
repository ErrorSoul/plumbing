
class Subcategory < ActiveRecord::Base
  belongs_to :category, inverse_of: :subcategories
  has_one :prototype, inverse_of: :subcategory
  has_many :products, inverse_of: :subcategory
  has_many :models, inverse_of: :subcategory
  accepts_nested_attributes_for :prototype, :models,   allow_destroy: true
  validates :name,  presence: true
  
end
# -*- coding: utf-8 -*-
ActiveAdmin.register Subcategory do
  permit_params :name, :category_id,  models_attributes: [:id, :name, :_destroy]
  

  index do 
    column_creator([:id, :name, :updated_at], action_flag=true)
  end

   form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :category , label: "Category", :as => :select , :collection => Category.all, include_blank: false
      f.input :name
      
    end
    
   
   
   
    
    f.actions
  end

  show do |x|
     attributes_table do 
      row do 
        link_to "AAAAA" , admin_subcategory_new_path
      end
    end
    create_show(x, [:id, :name], d: 
                {table_hash: {prototype: [:name]}, 
                  links_hash: {prototype: :subcategory_id}
                              
                })
   
  end

  

end
