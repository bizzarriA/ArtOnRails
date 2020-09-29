class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :artistum, optional: true, dependent: :destroy
  has_many :pagamentos, inverse_of: :user, dependent: :destroy
  has_many :acquistos, inverse_of: :user, dependent: :destroy
  has_many :operas, through: :acquistos

end
