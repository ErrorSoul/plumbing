class CreatePrototypeOptionTypes < ActiveRecord::Migration
  def change
    create_table :prototype_option_types do |t|
      t.references :prototype, index: true
      t.references :option_type, index: true

      t.timestamps
    end
  end
end
