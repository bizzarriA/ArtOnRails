class Offerta < ApplicationRecord
  validates :importo, presence: true
  validates :user_id, presence: true
  validates :asta_id, presence: true

  belongs_to :asta, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
