class RemoveTimestampsFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :created_at, :string
    remove_column :vendors, :updated_at, :string
  end
end
