FactoryGirl.define do
  factory :position do
    association :article, strategy: :build
    user_ip '0.0.0.0'
    offset 0
  end
end
