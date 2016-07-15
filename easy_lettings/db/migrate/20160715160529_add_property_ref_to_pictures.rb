class AddPropertyRefToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :property, foreign_key: true
  end
end
