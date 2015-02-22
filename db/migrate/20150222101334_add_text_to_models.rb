class AddTextToModels < ActiveRecord::Migration
  def change
    add_column :models, :text, :text
  end
end
