class Gallery < ApplicationRecord
  belongs_to :property

  has_many :pictures

  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
