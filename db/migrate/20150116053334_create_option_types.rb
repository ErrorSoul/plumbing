class CreateOptionTypes < ActiveRecord::Migration
  def change
    create_table :option_types do |t|
      t.string :name
      t.references :type, index: true

      t.timestamps
    end
  end
end
