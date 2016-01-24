class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :asset
      t.integer :current_id

      t.timestamps
    end
  end
end
