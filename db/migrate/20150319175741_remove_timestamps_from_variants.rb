class RemoveTimestampsFromVariants < ActiveRecord::Migration
  def change
    remove_column :variants, :created_at, :string
    remove_column :variants, :updated_at, :string
  end
end
