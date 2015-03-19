class RemoveTimestampsFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :created_at, :string
    remove_column :types, :updated_at, :string
  end
end
