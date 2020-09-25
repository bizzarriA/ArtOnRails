class AddSearch < ActiveRecord::Migration[6.0]
  def change
    create_table :search do |t|
      t.string :titolo
      t.string :tecnica
      t.numeric :anno
      t.string :artista
      t.timestamps
    end

  end
end
