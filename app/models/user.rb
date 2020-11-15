
class UserValidator < ActiveModel::Validator
  def validate(record)
    if record.dob.blank?
      record.errors[:dob] << "campo obbligatorio!"
    elsif record.dob > 18.years.ago
      record.errors[:dob] << "non accettabile (scusa, ma devi avere almeno 18 anni per iscriverti)"
    end
  end
end


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_with UserValidator

  belongs_to :artistum, optional: true, dependent: :destroy
  has_many :pagamentos, inverse_of: :user, dependent: :destroy
  has_many :acquistos, inverse_of: :user, dependent: :destroy
  has_many :operas, through: :acquistos
  has_many :astas, dependent: :destroy # vincitore
  has_many :offertas, dependent: :destroy

end
