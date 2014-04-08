require 'spec_helper'

feature 'user can record building', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  context 'associating a building with an owner' do
    before(:each) do
      @building = FactoryGirl.create(:building)
      @owner = FactoryGirl.create(:owner)
    end

    it 'lists buildings owned by the owner' do
      visit '/owner/building'

      expect(page).to have_content('List of Buildings')
    end

    it 'selects one building owned by the owner' do
      visit building_path(@building)

      expect(page).to have_content('1 wall st')
    end

  end
end
