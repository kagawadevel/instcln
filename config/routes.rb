Rails.application.routes.draw do



  resources :users, exept: :index do
    collection do
      post :confirm
    end
  end

end
