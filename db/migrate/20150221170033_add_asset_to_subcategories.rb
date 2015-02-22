class AddAssetToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :asset, :string
  end
end
