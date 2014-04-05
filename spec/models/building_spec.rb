require 'spec_helper'

describe Building do
  describe "Validation Tests" do
      it { should have_valid(:address).when("1 wall st") }
      it { should_not have_valid(:address).when(nil, "") }

      it { should have_valid(:city).when("Boston") }
      it { should_not have_valid(:city).when(nil, "") }

      it { should have_valid(:state).when('MA') }
      it {should_not have_valid(:state).when(nil, '', 'dskfjskdf') }

      it { should have_valid(:postal_code).when('02138') }
      it {should_not have_valid(:postal_code).when(nil, '',"dfjsdk",'12') }
  end

    describe "Association Tests" do

      it { should belong_to :owner }
    
    end
  pending "add some examples to (or delete) #{__FILE__}"
end
