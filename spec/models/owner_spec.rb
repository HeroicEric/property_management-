require 'spec_helper'

describe Owner do
   describe "Validation Tests" do

      it { should have_valid(:first_name).when("Robel") }
      it { should_not have_valid(:first_name).when(nil, "") }

      it { should have_valid(:last_name).when("Tezera") }
      it { should_not have_valid(:last_name).when(nil, "") }

      it { should have_valid(:email).when('r4eth@yahoo.com') }
      it {should_not have_valid(:email).when(nil, '', 'user.com', 'user', '.com', 'my@com', 'user@ecncom') }
    end

  pending "add some examples to (or delete) #{__FILE__}"
end
