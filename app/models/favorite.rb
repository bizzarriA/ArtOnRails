class Favorite < ApplicationRecord

  def self.opere(id)
    acquisti = Acquisto.select('*').where('user_id = ?', id)
    opere = []
    acquisti.each do |acquisto|
      opere << Opera.find(acquisto.opera_id)
    end
    opere
  end
end
