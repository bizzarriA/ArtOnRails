class DefaultSearch < ActiveRecord::Migration[6.0]
  def change
    drop_table :searches

    create_table :searches do |t|
      t.string :titolo, default: '%'
      t.string :tecnica, default:'%'
      t.numeric :anno, default:'%'
      t.string :artista, default:'%'
      t.timestamps
    end

  end
end
