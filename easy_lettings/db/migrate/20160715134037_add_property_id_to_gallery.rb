class AddPropertyIdToGallery < ActiveRecord::Migration[5.0]
  def change
    add_reference :galleries, :property, foreign_key: true
  end
end
