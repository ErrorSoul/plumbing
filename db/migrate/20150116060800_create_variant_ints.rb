class CreateVariantInts < ActiveRecord::Migration
  def change
    create_table :variant_ints do |t|
      t.integer :value

      t.timestamps
    end
  end
end
