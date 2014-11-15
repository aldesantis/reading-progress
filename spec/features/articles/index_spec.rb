require 'rails_helper'

RSpec.feature 'The articles index' do
  scenario 'shows a list of articles' do
    article = FactoryGirl.create(:article)
    visit root_path
    expect(page).to have_content(article.title)
  end
end
