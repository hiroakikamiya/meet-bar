Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  resources :restaurants, only: [:index, :new, :create, :update] do
    resources :images
  end
  resources :users, only: [:show, :destroy]
  get '/restaurants/:reserve_date', to: 'restaurants#show'
end
