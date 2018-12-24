class Image < ApplicationRecord
  has_one_attached :attachment

  validate :attachment_or_url_present

  private

  def attachment_or_url_present
    errors.add :base, "Missing attachment or url" if self.attachment.nil? && self.url.nil?
  end
end
