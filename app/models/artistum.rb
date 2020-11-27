class Artistum < ApplicationRecord

  has_one :user
  has_many :operas, dependent: :destroy
end
