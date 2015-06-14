class ChangeDefaultPercent < ActiveRecord::Migration
  def change
	change_column :models, :percent,  :integer, default: 0
  end
end
