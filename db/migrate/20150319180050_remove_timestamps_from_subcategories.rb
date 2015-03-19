class RemoveTimestampsFromSubcategories < ActiveRecord::Migration
  def change
    remove_column :subcategories, :created_at, :string
    remove_column :subcategories, :updated_at, :string
  end
end
