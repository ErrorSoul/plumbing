class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :marking
      t.references :subcategory, index: true
      t.references :model, index: true

      t.timestamps
    end
  end
end
