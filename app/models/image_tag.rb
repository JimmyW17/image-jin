class ImageTag < ApplicationRecord
  belongs_to :image
  belongs_to :tag, counter_cache: :images_count
end
