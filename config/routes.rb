Rails.application.routes.draw do
  resources :images do
    collection do
      post :upload
    end
  end
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "home#index"
end
