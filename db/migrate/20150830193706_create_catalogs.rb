class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
      t.string :asset

      t.timestamps
    end
  end
end
