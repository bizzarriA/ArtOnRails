class AddUnnecessaryColumnUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :cellulare, :numeric
    remove_column :users, :url_foto, :varchar
  end
end
