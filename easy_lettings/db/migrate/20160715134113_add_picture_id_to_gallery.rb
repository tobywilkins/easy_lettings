class AddPictureIdToGallery < ActiveRecord::Migration[5.0]
  def change
    add_reference :galleries, :picture, foreign_key: true
  end
end
