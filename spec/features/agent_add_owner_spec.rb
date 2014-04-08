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
    it 'registers an owner' do
      visit '/owners/new'

      fill_in 'First name', with: 'Mike'
      fill_in 'Last name', with: "Smith"
      fill_in 'Email', with: 'r4eth@yahoo.com'
      click_on 'Create Owner'

      expect(page).to have_content('Owner Added to Listing')
      expect(current_path).to eq new_owner_path
    end
  end

  context 'with invalid attributes' do
    it 'shows error if required fields are missing' do
      visit '/owners/new'

      click_on 'Create Owner'

      expect(page).to_not have_content("Owner Added to Listing")
      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email can't be blank")
    end
  end
end
