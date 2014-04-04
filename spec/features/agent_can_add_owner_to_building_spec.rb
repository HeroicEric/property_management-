require 'spec_helper'

feature 'user can record building', %q{
  As a real estate associate
I want to record a building owner
So that I can keep track of our relationships with owners
  } do
   
    # I must specify a first name, last name, and email address
    # I can optionally specify a company name
    # If I do not specify the required information, I am presented with errors
    # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  context 'with valid attributes' do
     before(:each) do
      @agent = FactoryGirl.create(:building)
    end
    it 'registers an owner' do
  
      visit '/building/owner/new'

      fill_in 'Address', from: '1 wall st'
      fill_in 'City', with: "Boston"
      select 'MA', from: 'State'
      fill_in 'Postal code', with: '02148'

      click_on 'Create Building'

      expect(Building.count).to eq(1)
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  context 'with invalid attributes' do
    it 'shows error if required fields are missing' do
      visit '/building/onwer/new'
      click_on 'Create Building'
 
      expect(page).to_not have_content("Blog Added to Listing")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Postal code can't be blank")
    end
  end
end
