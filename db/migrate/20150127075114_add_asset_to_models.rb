class AddAssetToModels < ActiveRecord::Migration
  def change
    add_column :models, :asset, :string
  end
end
