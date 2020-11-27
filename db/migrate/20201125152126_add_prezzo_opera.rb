class AddPrezzoOpera < ActiveRecord::Migration[6.0]
  def change
    add_column :operas, :prezzo, :float

  end
end
