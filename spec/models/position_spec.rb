require 'rails_helper'

RSpec.describe Position do
  subject { FactoryGirl.build_stubbed(:position) }

  %w(article user_ip offset).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  it 'validates the numericality of offset' do
    expect(subject).to validate_numericality_of(:offset).only_integer.is_greater_than_or_equal_to(0)
  end

  it 'validates the format of user_ip' do
    expect(subject).not_to allow_value('foobar').for(:user_ip)
  end
end
