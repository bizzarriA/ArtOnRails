class Acquisto < ApplicationRecord
  validates :opera_id, presence: true
  validates :user_id, presence: true
  validates :pagamento_id, presence: true

  def self.opere(user_id)
    acquisti = Acquisto.select('*').where('user_id = ?', user_id)
    opere = []
    acquisti.each do |acquisto|
      opere << Opera.find(acquisto.opera_id)
    end
    opere
  end


  has_one :pagamento
  has_one :opera
  has_one :user
end
