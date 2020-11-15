class Favorite < ApplicationRecord
  validates :opera_id, presence: true
  validates :user_id, presence: true

  has_one :opera
  has_one :user

  def self.opere(id)
    prefe = Favorite.select('*').where('user_id = ?', id)
    opere = []
    prefe.each do |pref|
      opere << Opera.find(pref.opera_id)
    end
    opere
  end
end
