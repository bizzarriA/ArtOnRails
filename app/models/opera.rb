class Opera < ApplicationRecord
  validates :titolo, presence: true
  validates :url, presence: true
  validates :artista_id, presence: true
  mount_uploader :url, AvatarUploader



end