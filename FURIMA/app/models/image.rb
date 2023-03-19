
class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :data, ImageUploader
end
