class Asta < ApplicationRecord
  validates :inizio, presence: true
  validates :fine, presence: true
  validates :opera_id, presence: true

  belongs_to :opera
  has_many :offertas
  # belongs_to :user

  def self.find_by_user(user_id)
    offerte = Offerta.find_by_user_id(user_id)
    aste = []
    unless offerte.nil?
      offerte.each do |offerta|
        aste << Asta.find(offerta.asta_id)
      end
    end

    return aste
  end

  def self.find_by_artista(artista_id)
    opere = Opera.where("artista_id = ? ", artista_id)
    aste = []
    unless opere.nil?
      opere.each do |opera|
        aste << Asta.find_by_opera_id(opera.id)
      end
    end
    return aste
  end

end
