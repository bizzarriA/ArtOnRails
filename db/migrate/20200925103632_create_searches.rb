class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :titolo, default: 'all'
      t.string :tecnica, default: 'all'
      t.numeric :anno
      t.string :artista, default: 'all'
      t.timestamps
    end

  end
end
