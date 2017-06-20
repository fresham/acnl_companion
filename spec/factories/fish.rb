FactoryGirl.define do
  factory :fish do
    sequence(:name, 'A') { |n| "Fish #{n}" }
  end
end
