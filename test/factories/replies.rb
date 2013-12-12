# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reply do
    sender_id 1
    receiver_id 1
    comment "MyText"
    callout_id 1
  end
end
