class RemoveValueIdFromVariants < ActiveRecord::Migration
  def change
    remove_column :variants, :value_id, :integer
    remove_column :variants, :value_type, :string
    add_column :variants, :value, :string
  end
end
