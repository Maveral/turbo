Rails.application.routes.draw do
  resources :mechanics
  root to: "riders#index"
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :clubs
  resources :riders do
    resource :like
    collection do
      post 'search'
    end
  end
end
