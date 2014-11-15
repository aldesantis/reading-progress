require 'rails_helper'

RSpec.describe Article do
  subject { FactoryGirl.build_stubbed(:article) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(title body).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end
end
