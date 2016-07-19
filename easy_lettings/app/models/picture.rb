class Picture < ApplicationRecord
  before_validation { image.clear if @delete_image }
  has_attached_file :image,
    :styles => {
    :thumb => "100x100#",
    :small  => "150x150>",
    :medium => "200x200",
    :large => "600x600^#"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_one :property

  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end

end
