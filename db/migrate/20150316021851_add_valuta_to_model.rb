class AddValutaToModel < ActiveRecord::Migration
  def change
    add_reference :models, :valuta, index: true
  end
end
