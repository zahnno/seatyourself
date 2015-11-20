Rails.application.routes.draw do

  root 'restaurants#index'
  resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants do
    resources :reservations, only: [:index, :new, :create, :destroy]
  end

  resources :users, only: [:new, :create, :show]

end
