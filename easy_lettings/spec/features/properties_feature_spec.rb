require 'rails_helper'

feature 'property' do

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
