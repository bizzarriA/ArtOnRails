class AddCompratoreRefToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :compratore, foreign_key: true
  end
end
