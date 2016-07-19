class Property < ApplicationRecord

  has_many :pictures, dependent: :destroy

  def self.generate_google_maps_url(postcode,google_api = ENV["GOOGLE_MAPS_KEY"])
    prefix_string = "https://maps.googleapis.com/maps/api/staticmap?zoom=15&size=600x600"
    key = "&key=" + google_api
    postcode = "&markers=" + postcode
    return prefix_string + key + postcode
  end

  def delete_images

  end

  def self.create_google_image(postcode)
  image_url = self.generate_google_maps_url(postcode)
  URI.parse(image_url)
  end

end
