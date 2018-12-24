class Image < ApplicationRecord
  has_one_attached :image

  validate :attachment_or_url_present

  private

  def attachment_or_url_present
    errors.add :base, "Missing attachment or url" if self.image.nil? || self.url.nil?
  end
end
