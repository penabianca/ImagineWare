require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'ImagineWare'" do
      visit '/static_pages/home'
      expect(page).to have_content ('ImagineWare')
    end
  end
  describe "Help page" do
    it "should have the content 'Help' " do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  describe "About page" do
    it "should have the content 'About Us' " do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
  end
end
