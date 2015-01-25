ActiveAdmin.register Subcategory do
  permit_params :name, :category_id
  config.sort_order = 'id_asc'



   form do |f|
    f.inputs 'Details' do
      f.input :category , label: "Category", :as => :select , :collection => Category.all, include_blank: false
      f.input :name
      f.input :created_at, label: 'Publish Post At'
    end
    
   
   
   
    
    f.actions
  end

  

end
