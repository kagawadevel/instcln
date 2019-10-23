Rails.application.routes.draw do

  root to: 'posts#index'

  resources :favorites, only: [:index, :create, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :users, except: :index do
    collection do
      post :confirm
    end
  end

end
