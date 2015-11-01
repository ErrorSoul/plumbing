class AddUserTypeToCatalogs < ActiveRecord::Migration
  def change
    add_column :catalogs, :user_type, :string
  end
end
