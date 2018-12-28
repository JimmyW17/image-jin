class Image < ApplicationRecord
  has_one_attached :attachment
  has_many :image_tags
  has_many :tags, through: :image_tags, counter_cache: :images_count

  validate :attachment_or_url_present

  after_create :generate_tags

  # TODO: Move analyze_and_return_labels_with_score into a worker
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

  # TODO: Move generate_tags into a worker
  def generate_tags
    tag_data = self.analyze_and_return_labels_with_score
    tag_data.each do |description, score|
      tag = Tag.find_or_create_by(description: description)
      self.image_tags.create(score: score, description: description, tag: tag)
    end
  end

  private

  def attachment_or_url_present
    errors.add :base, "Missing attachment or url" if self.attachment.nil? && self.url.nil?
  end
end
