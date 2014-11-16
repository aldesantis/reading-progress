require 'rails_helper'

RSpec.describe PositionsController do
  describe "GET 'show'" do
    let!(:position) { FactoryGirl.create(:position) }
    let!(:article) { position.article }

    it 'loads the position' do
      get :show, article_id: article.id, format: :json
      expect(assigns(:position)).to eq(position)
    end
  end

  describe "PUT 'update'" do
    let!(:article) { FactoryGirl.create(:article) }

    context 'when no position exists' do
      it 'creates the position' do
        expect {
          put :update, article_id: article.id, position: { offset: 1 }, format: :json
        }.to change(article.positions, :count).by(1)
      end
    end

    context 'when a position exists' do
      let!(:position) { FactoryGirl.create(:position, article: article) }

      it 'updates the position' do
        expect {
          put :update, article_id: article.id, position: { offset: 1 }, format: :json
          position.reload
        }.to change(position, :offset).to(1)
      end
    end
  end
end
