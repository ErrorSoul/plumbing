# -*- coding: utf-8 -*-
ActiveAdmin.register Product do
  


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  config.clear_action_items!
  permit_params :id, :subcategory_id, :model_id, :name, :description, :price, :marking,  variants_attributes: [:id, :option_type_id, value_attributes: [:id, :value, :value_type]]
  

  controller do 
   
    
    
    def new
      #pry.binding
      @prot = Prototype.includes(:option_types => :type).where('subcategory_id =?', params[:product][:subcategory_id]).first
      @product = Product.new
      for c in @prot.option_types
  
      
        @product.variants.build(option_type: c , value: c.type.name.eql?("INT") ? VariantInt.new : VariantStr.new)
      end
    end
  end
   form do |f|
    
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
      f.input :subcategory, label: "Subcategory", :as => :select , :collection => Subcategory.all, include_blank: false
      f.input :model, label: "Model", :as => :select , :collection => Model.all, include_blank: false
      f.input :marking
      f.input :price
      f.input :description
     
      
     
      
     
    end
    f.inputs do
      render 'variants' , f: f
    end
    
   f.actions
  end

end
