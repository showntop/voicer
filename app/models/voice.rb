class Voice < ApplicationRecord
  self.table_name = "photos"
  belongs_to :user

  validates_presence_of :image

  mount_uploader :image, VoiceUploader
end
