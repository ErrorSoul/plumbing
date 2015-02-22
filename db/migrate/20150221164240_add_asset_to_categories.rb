class AddAssetToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :asset, :string
  end
end
