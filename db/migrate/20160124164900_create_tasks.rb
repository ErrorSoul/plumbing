class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :report_id
      t.string :remember_token
      t.string :status

      t.timestamps
    end
  end
end
