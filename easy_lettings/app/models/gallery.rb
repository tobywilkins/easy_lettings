class Gallery < ApplicationRecord
  belongs_to :property
  belongs_to :picture

  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
