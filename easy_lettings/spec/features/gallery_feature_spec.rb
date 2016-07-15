require 'rails_helper'

feature "Multiple image gallery" do
  before do
    create_admin_user
  end

  scenario "add an image to a property" do
    visit '/'
    click_link('Add a property')
    fill_in('Name', with: 'The Bays')
    fill_in('Description', with: 'Its a lovely large family home')
    fill_in('Price', with: '800')
    attach_file('Image', File.absolute_path("#{ Rails.root }/spec/support/fixtures/house.jpg"))
    click_button('Add Property')
    expect(Gallery.first).to have_attached_file(:image)
  end

end
