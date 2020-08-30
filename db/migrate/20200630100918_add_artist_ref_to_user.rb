class AddArtistRefToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :artista, foreign_key: true
  end
end
