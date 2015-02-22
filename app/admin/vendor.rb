ActiveAdmin.register Vendor do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :country_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    column_creator([:id, :name, :updated_at], action_flag = true)
  end

  show do |x|
    create_show(x, [:id, :name, :country], d:
               { table_hash: nil,
                 links_hash: nil

               })
  end
end
