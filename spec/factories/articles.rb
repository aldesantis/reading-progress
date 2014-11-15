FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.words(5).join(' ').capitalize }
    body { Faker::Lorem.paragraph }
  end
end
