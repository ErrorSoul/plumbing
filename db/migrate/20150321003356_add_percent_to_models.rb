class AddPercentToModels < ActiveRecord::Migration
  def change
    add_column :models, :percent, :integer
  end
end
