class AddAssetToProducts < ActiveRecord::Migration
  def change
    add_column :products, :asset, :string
  end
end
