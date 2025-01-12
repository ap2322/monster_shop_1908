
require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    it "I see a nav bar with links to all pages" do
      visit '/merchants'

      within 'nav' do
        click_link 'All Items'
      end

      expect(current_path).to eq('/items')

      within 'nav' do
        click_link 'All Merchants'
      end

      expect(current_path).to eq('/merchants')
    end

    it "I can see a cart indicator on all pages" do
      visit '/merchants'

      within 'nav' do
        expect(page).to have_content("Cart: 0")
      end

      visit '/items'

      within 'nav' do
        expect(page).to have_content("Cart: 0")
      end

    end

    it 'has a link to the homepage ' do
      visit '/merchants'
      within '.topnav' do
        click_link "Home"
      end

      expect(current_path).to eq("/")
      expect(page).to have_css('.topnav')
      expect(page).to have_content("Welcome to Monster Shop")
    end

    it "has a link to register" do
      visit '/merchants'
      within '.topnav' do
        click_link "Register"
      end

      expect(current_path).to eq("/register")
      expect(page).to have_css('.topnav')
    end

    it "has a link to login" do
      visit '/merchants'
      within '.topnav' do
        click_link "Login"
      end

      expect(current_path).to eq("/login")
      expect(page).to have_css('.topnav')
    end
  end
end
