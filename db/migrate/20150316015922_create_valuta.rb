class CreateValuta < ActiveRecord::Migration
  def change
    create_table :valuta do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
