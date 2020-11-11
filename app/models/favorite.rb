class Favorite < ApplicationRecord

  def self.opere(id)
    prefe = Favorite.select('*').where('user_id = ?', id)
    opere = []
    prefe.each do |pref|
      opere << Opera.find(pref.opera_id)
    end
    opere
  end
end
