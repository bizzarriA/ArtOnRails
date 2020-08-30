class CreateArtista < ActiveRecord::Migration[6.0]
  def change
    create_table :artista do |t|

      t.timestamps
    end
  end
end
