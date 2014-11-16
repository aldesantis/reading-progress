Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: :show do
    resource :position, only: [:show, :update]
  end
end
