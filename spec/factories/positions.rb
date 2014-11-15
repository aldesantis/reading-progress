FactoryGirl.define do
  factory :position do
    association :article, strategy: :build
    user_ip '127.0.0.1'
    offset 0
  end
end
