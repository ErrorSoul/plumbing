class RemoveTimestampsFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :created_at, :string
    remove_column :prototypes, :updated_at, :string
  end
end
