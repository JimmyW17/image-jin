class Image < ApplicationRecord
  has_one_attached :attachment

  validate :attachment_or_url_present

  def analyze_and_return_labels_with_score
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    file_name = self.image_on_disk
    response = image_annotator.label_detection image: file_name
    return_data = Hash.new()
    response.responses.each do |res|
      res.label_annotations.each do |label|
        return_data[label.description] = label.score
      end
    end
    return_data
  end

  def image_on_disk
    ActiveStorage::Blob.service.send(:path_for, self.attachment.key)
  end

  private

  def attachment_or_url_present
    errors.add :base, "Missing attachment or url" if self.attachment.nil? && self.url.nil?
  end
end
