class AddReferencesAsta < ActiveRecord::Migration[6.0]
  def change
    add_reference :offerta, :asta, foreign_keys: true
    add_reference :asta, :opera, foreign_keys: true
    add_reference :offerta, :user, foreign_keys: true

  end
end
