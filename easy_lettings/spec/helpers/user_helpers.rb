require "spec_helper"

def create_normal_user
  visit('/')
  click_link('Sign Up')
  fill_in('Email', with: 'toby@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  click_button('Sign out')
end

def create_admin_user
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'admin@easylettings.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  User.make_admin('admin@easylettings.com')
end

def sign_in_normal_user
  visit('/')
  click_link('Log In')
  fill_in('Email', with: 'toby@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Log in')
end
