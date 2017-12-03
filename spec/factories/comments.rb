FactoryBot.define do
  factory :comment do
    body "MyText"
    email "test@test.se"
    article nil
  end
end
