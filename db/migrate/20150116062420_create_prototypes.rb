class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.references :subcategory, index: true

      t.timestamps
    end
  end
end
