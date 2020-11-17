class OffertaValidator < ActiveModel::Validator
  def validate(record)
    importo = Float(record.importo)
    importo_min = Asta.miglior_offerta(record.asta_id).importo
    if importo_min > importo
      record.errors[:error] << ": Devi fare un offerta più alta per quest'asta!"
    end
  end
end
class Offerta < ApplicationRecord
  validates :importo, presence: true
  validates :user_id, presence: true
  validates :asta_id, presence: true

  validates_with OffertaValidator

  belongs_to :asta, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
