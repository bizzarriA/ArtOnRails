class Opera < ApplicationRecord
  mount_uploader :url, AvatarUploader
end
