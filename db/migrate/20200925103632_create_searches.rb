class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :titolo
      t.string :tecnica
      t.numeric :anno
      t.string :artista
      t.timestamps
    end

    drop_table :search

  end
end
