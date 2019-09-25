Rails.application.routes.draw do



  resources :users, except: :index do
    collection do
      post :confirm
    end
  end

end
