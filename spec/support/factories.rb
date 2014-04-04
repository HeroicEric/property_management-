FactoryGirl.define do

  factory :building do
    Address '1 wall st'
    City 'Boston'
    State 'MA'
    Postal_code '02148'
  end

  factory :owner do
    First_name 'Mike'
    Last_name 'Smith'
    Email 'r4eth@yahoo.com'
  end
end
