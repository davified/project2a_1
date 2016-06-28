require 'rails_helper'
require_relative './shared/signed_in_out'

RSpec.describe 'Signing in' do
  let!(:user) { User.create(email: 'lama@gmail.com', password: '12345678') }

  context 'when a user is signed in' do
    before do
      ensure_on home_path
      click_on 'Sign In'

      fill_in 'Email', with: 'lama@gmail.com'
      fill_in 'Password', with: '12345678'
      click_on 'Log In'
    end

    include_examples 'a signed in user'

    it 'shows them the home page' do
      expect(page.current_path).to eq(home_path)
    end

    it 'lets the user sign out' do
      click_on 'Sign Out'

      expect(page).to have_content('Signed out')
      expect(page).to_not have_content('lama@gmail.com')
      expect(page.current_path).to eq(home_path)
    end
  end

  context 'when the wrong email and password are provided' do
    before do
      ensure_on home_path
      click_on 'Sign In'

      fill_in 'Email', with: 'nonexistant@example.com'
      fill_in 'Password', with: 'doesnt_matter'
      click_on 'Log In'
    end

    it "shows a failure message" do
      expect(page).to have_content "Couldn't sign you in. Please check your email and password."
    end

  end
end
