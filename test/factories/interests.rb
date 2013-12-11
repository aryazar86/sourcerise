# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interest, :class => 'Interests' do
    name "MyString"
    topic "MyString"
    parent_id 1
    description "MyText"
    interestable_type "MyString"
    interestable_id 1
  end
end
