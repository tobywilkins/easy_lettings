require 'rails_helper'

feature 'display properties' do

  context 'no properties have been added' do
    scenario 'should display text that no properties have been added' do
      visit '/'
      expect(page).to have_content 'No properties currently available'
    end
  end

  context 'properties have been added' do
    before do
      Property.create(name: 'Tobys house')
    end

    scenario 'display restaurants' do
      visit '/'
      expect(page).to have_content('Tobys house')
      expect(page).not_to have_content 'No properties currently available'
    end
  end
end

feature 'create properties' do
  context 'As admin user' do
    before do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: 'admin@easylettings.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        User.make_admin('admin@easylettings.com')
    end

    scenario 'admin user creates property' do
      visit('/')
      click_link('Add a property')
      fill_in('Name', with: 'The Bays')
      fill_in('Description', with: 'Its a lovely large family home')
      fill_in('Price', with: '800')
      click_button('Add Property')
      expect(current_path).to eq('/')
      expect(page).to have_content('The Bays')
    end
  end
end

feature 'edit properties ' do
  context 'As admin user' do
    before do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: 'admin@easylettings.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        User.make_admin('admin@easylettings.com')
    end
  end
end
