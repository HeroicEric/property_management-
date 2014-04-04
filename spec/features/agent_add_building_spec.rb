require 'spec_helper'

feature 'user can record building', %q{
  As a real estate associate
I want to record a building
So that I can refer back to pertinent information
  } do
  
    # I must specify a street address, city, state, and postal code
    # Only US states can be specified
    # I can optionally specify a description of the building
    # If I enter all of the required information in the required format, the building is recorded.
    # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
    # Upon successfully creating a building, I am redirected so that I can record another building.


  context 'with valid attributes' do
    before(:each) do
      @agent = FactoryGirl.create(:owner)
    end

    it 'registers a building' do
  
      visit '/owner/building/new'

      fill_in 'Address', from: '1 wall st'
      fill_in 'City', with: "Boston"
      select 'MA', from: 'State'
      fill_in 'Postal code', with: '02148'

      click_on 'Create Building'

      expect(Building.count).to eq(1)
      expect(page).to have_content("Building Added to Listing")
    end
  end

  context 'with invalid attributes' do
    it 'shows error if required fields are missing' do
      visit '/owner/building/new'
      click_on 'Create Building'
 
      expect(page).to_not have_content("Building Added to Listing")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Postal code can't be blank")
    end
  end
end
