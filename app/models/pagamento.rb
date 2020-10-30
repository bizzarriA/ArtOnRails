class PagamentoValidator < ActiveModel::Validator
  def validate(record)
    anno = record.anno + 2000
    if anno == Time.new.year and record.mese < Time.new.month
      record.errors[:error] << ": Data di scadenza non valida, non può essere precedenete al mese corrente!"
    end
  end
end

class Pagamento < ApplicationRecord
  validates :intestatario, presence: true
  validates :numero, presence: true,
            format: { with: /\A[0-9]+\z/, message: "di carta non valido, deve contenere solo numeri" },
            length: { is: 16, message: "di carta non valido, deve contenere esattamente 16 numeri"  }
  validates :mese, presence: true, numericality: { only_integer: true },
            inclusion: {in: 1..12, message:"deve essere un numero compreso tra 1 e 12!"}
  validates :anno, presence: true, numericality: { only_integer: true },
            inclusion: {in: Time.new.year-2000..(Time.new.year-1990), message: "non può essere precedente a oggi"}
  validates :cvv, presence: true, format: { with: /\A[0-9]+\z/, message: "non valido, può contenere solo numeri" },
            length: { is: 3, message: "non valido, deve avere 3 numeri!" }

  validates_with PagamentoValidator

  def self.find_pay_methods(user_id)
    Pagamento.where("user_id = ?", user_id)
  end

  belongs_to :user
end
