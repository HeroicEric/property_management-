require 'spec_helper'

describe Owner do
  describe "validation associations" do
    it { should have_many :buildings }
  end

  describe "Validation Tests" do
    it { should have_valid(:first_name).when("Robel") }
    it { should_not have_valid(:first_name).when(nil, "") }

    it { should have_valid(:last_name).when("Tezera") }
    it { should_not have_valid(:last_name).when(nil, "") }

    it { should have_valid(:email).when('r4eth@yahoo.com') }
    it {should_not have_valid(:email).when(nil, '', 'user.com', 'user', '.com', 'my@com', 'user@ecncom') }
  end
end
