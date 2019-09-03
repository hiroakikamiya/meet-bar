Rails.application.routes.draw do

  devise_for :users

  root 'restaurants#index'

  resources :restaurants, only: [:index, :new, :create, :update, :show, :edit] do
    collection do
      patch '/meet_update/:id', to: 'restaurant#meet_update'
      put '/meet_update/:id', to: 'restaurant#meet_update'
    end
    resources :messages, only: [:index, :create]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :destroy, :edit, :update]
  get '/restaurants/:reserve_date', to: 'restaurants#date'

end