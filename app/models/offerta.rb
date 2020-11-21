class OffertaValidator < ActiveModel::Validator
  def validate(record)
    importo = Float(record.importo)
    importo_min = Asta.miglior_offerta(record.asta_id)
    if importo_min == nil
      importo_min = 0
    else
      importo_min = importo_min.importo
    end
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

  def self.find_my_offert(asta_id, user_id)
    offerta = Offerta.includes(:user).where("asta_id = ? AND user_id = ?", asta_id, user_id)
    # byebug
    return offerta.first
  end
end
