class AddGalleryRefToProperty < ActiveRecord::Migration[5.0]
  def change
    add_reference :properties, :gallery, foreign_key: true
  end
end
