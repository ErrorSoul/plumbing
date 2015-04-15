class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.text :address
      t.string :phone
      t.string :total

      t.timestamps
    end
  end
end
