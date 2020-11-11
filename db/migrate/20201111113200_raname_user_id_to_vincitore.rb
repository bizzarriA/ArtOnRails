class RanameUserIdToVincitore < ActiveRecord::Migration[6.0]
  def change
    rename_column :asta, :users_id, :vincitore_id
  end
end
