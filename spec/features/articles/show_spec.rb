require 'rails_helper'

RSpec.feature 'The article page' do
  given!(:article) { FactoryGirl.create(:article) }

  background do
    visit root_path
  end

  scenario 'shows the article' do
    click_link article.title
    expect(page).to have_content(article.title)
  end

  scenario 'saves the reading progress', js: true do
    click_link article.title

    sleep 0.5
    page.execute_script 'window.scrollBy(0, 100)'
    sleep 2.5

    expect(page).to have_content('SENT!')
  end

  scenario 'loads the reading progress', js: true do
    FactoryGirl.create(:position, article: article, offset: 200)

    click_link article.title

    expect(page).to have_content('LOADED!')
  end
end
