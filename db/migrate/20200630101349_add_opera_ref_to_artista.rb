class AddOperaRefToArtista < ActiveRecord::Migration[6.0]
  def change
    add_reference :operas, :artista, foreign_key: true
  end
end
