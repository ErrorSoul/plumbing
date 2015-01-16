class CreateVariantStrs < ActiveRecord::Migration
  def change
    create_table :variant_strs do |t|
      t.string :value

      t.timestamps
    end
  end
end
