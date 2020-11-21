class Opera < ApplicationRecord
  validates :titolo, presence: true
  validates :url, presence: true
  validates :artista_id, presence: true
  mount_uploader :url, AvatarUploader

  TECNICHE = ['Acrilico', 'Acquarello', 'Fotografia', 'Grafica', 'Incisione', 'Matita', 'Olio su tela', 'Penna', 'Pennino',
              'Serigrafia', 'Scultura', 'Street', 'Tecnica Mista', 'Altro']

  has_one :artistum
  has_many :acquistos, inverse_of: :opera, dependent: :destroy
  has_many :users, through: :acquistos
  has_one :asta, dependent: :destroy


  def self.find_by_artista(artista_id)
    return Opera.where("artista_id = ?", artista_id)
  end

end