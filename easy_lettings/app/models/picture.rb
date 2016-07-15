class Picture < ApplicationRecord
  has_one :gallery_picture
  has_one :gallery, :through => :gallery_pictures
end
