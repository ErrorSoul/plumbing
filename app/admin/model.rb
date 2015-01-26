ActiveAdmin.register Model do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :subcategory_id, :name

  index do 
    column_creator([:id, :name, :updated_at], action_flag=true)
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  show do |x|
    
    create_show(x, [:id, :name, :subcategory], d: 
                {table_hash: {products: [:name]}, 
                  links_hash: {products: [:model_id, :subcategory_id]}
                              
                })
    

  end

end
