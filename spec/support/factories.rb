FactoryGirl.define do
  factory :building do
    address '1 wall st'
    city 'Boston'
    state 'MA'
    postal_code '02148'
  end

  factory :owner do
    first_name 'Mike'
    last_name 'Smith'
    email 'r4eth@yahoo.com'
  end
end
