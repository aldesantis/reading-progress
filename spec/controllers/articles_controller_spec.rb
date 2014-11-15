require 'rails_helper'

RSpec.describe ArticlesController do
  describe "GET 'index'" do
    let!(:article) { FactoryGirl.create(:article) }

    it 'loads the articles' do
      get :index
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe "GET 'show'" do
    let!(:article) { FactoryGirl.create(:article) }

    it 'loads the article' do
      get :show, id: article.id
      expect(assigns(:article)).to eq(article)
    end
  end
end
