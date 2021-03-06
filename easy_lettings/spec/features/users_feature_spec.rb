require 'rails_helper'

feature "Homepage links" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "non admin user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end

    it 'should not see an add a property link' do
      visit('/')
      expect(page).not_to have_link('Add a property')
    end
  end

  context 'signed in admin user' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'admin@easylettings.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      User.make_admin('admin@easylettings.com')
    end

    scenario 'admin should be able to see add property' do
      visit('/')
      expect(page).to have_link('Add a property')
    end
  end

end
