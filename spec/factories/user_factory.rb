FactoryGirl.define do
  
  factory :user do
    password "pass"
    password_confirmation "pass"

    email "Doe@doe.com"
    first_name "John"
    last_name "Doe"
    # bio "A long overblown paragraph about your experience."
    # organization "News Factory"
    # location "A city"
    user_role_id "1"
    
  end


end