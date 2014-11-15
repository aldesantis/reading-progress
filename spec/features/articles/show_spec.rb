require 'rails_helper'

RSpec.feature 'The article page' do
  scenario 'shows the article' do
    article = FactoryGirl.create(:article)
    visit root_path
    click_link article.title
    expect(page).to have_content(article.title)
  end
end
