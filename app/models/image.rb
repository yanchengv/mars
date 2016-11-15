class Image < ApplicationRecord
  mount_uploader :url, AvatarUploader
end
