class AddCampiOfferte < ActiveRecord::Migration[6.0]
  def change
    add_column :offerta, :importo, :float
    add_column :asta, :inizio, :datetime
    add_column :asta, :fine, :datetime
    add_reference :asta, :users, foreign_keys: true
  end
end
