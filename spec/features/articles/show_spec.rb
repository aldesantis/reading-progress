require 'rails_helper'

RSpec.feature 'The article page' do
  given!(:article) { FactoryGirl.create(:article) }

  background do
    visit root_path
    click_link article.title
  end

  scenario 'shows the article' do
    expect(page).to have_content(article.title)
  end

  scenario 'saves the reading progress', js: true do
    page.execute_script 'window.scrollBy(0, 100)'
    sleep 2.5
    expect(page).to have_content('SENT!')
  end
end
