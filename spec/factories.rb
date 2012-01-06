FactoryGirl.define do
  sequence :email do |n|
     "person#{n}@example.com"
   end
 end


FactoryGirl.define do

  factory :user do
    email
    password "anything"
  end

  factory :user_destination do
  end

  factory :destination do
    place "jiri"
    description "lovely place in eastern Nepal"
    user
  end
  factory :review do
    content "very very nice place. We are also going to jiri."
  end
end

