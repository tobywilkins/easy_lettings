class AddPostcodeToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :postcode, :string
  end
end
