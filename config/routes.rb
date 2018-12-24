Rails.application.routes.draw do
  resources :images
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "home#index"
end
