class Photo < ApplicationRecord
  belongs_to :user

  validates_presence_of :image

  mount_uploader :image, PhotoUploader
end
