class AddVendorToModels < ActiveRecord::Migration
  def change
    add_reference :models, :vendor, index: true
  end
end
