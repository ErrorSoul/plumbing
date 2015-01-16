class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.references :product, index: true
      t.references :option_type, index: true
      t.references :value, polymorphic: true, index: true

      t.timestamps
    end
  end
end
