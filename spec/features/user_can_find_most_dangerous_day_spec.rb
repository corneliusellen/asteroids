require 'rails_helper'

describe "User can find most dangerous day" do
  context "I visit the root page and enter start and end date" do
    it "I see a page that shows most dangerous day with asteroids' info" do
      visit root_path

      fill_in :start_date, with: "2018-01-01"
      fill_in :end_date, with: "2018-01-07"
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq(most_dangerous_day_path)
      expect(page).to have_content("Most Dangerous Day")
      expect(page).to have_content("January 01, 2018 - January 07")
      expect(page).to have_content("Name: (2014 KT76)")
      expect(page).to have_content("NEO Reference ID: 3672906")
      expect(page).to have_content("Name: (2001 LD)")
      expect(page).to have_content("NEO Reference ID: 3078262")
      expect(page).to have_content("Name: (2017 YR1)")
      expect(page).to have_content("NEO Reference ID: 3794979")
    end
  end
end
