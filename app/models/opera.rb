class Opera < ApplicationRecord
  validates :titolo, presence: true
  validates :url, presence: true
  validates :artista_id, presence: true
  mount_uploader :url, AvatarUploader

  TECNICHE = ['Acrilico', 'Acquarello', 'Fotografia', 'Grafica', 'Incisione', 'Matita', 'Olio', 'Penna', 'Pennino',
              'Serigrafia', 'Scultura', 'Street', 'Altro']

  has_one :artistum
  has_many :acquistos, inverse_of: :opera, dependent: :destroy
  has_many :users, through: :acquistos
  has_many :vendibiles, inverse_of: :opera, dependent: :destroy


end