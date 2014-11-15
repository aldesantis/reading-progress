FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.words(3).join(' ').capitalize }
    body { Faker::Lorem.paragraphs(20).join("\n\n") }
  end
end
