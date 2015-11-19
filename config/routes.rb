Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants do
    resources :reservations, only: [:index, :new, :create, :destroy]
  end

  resources :users, only: [:new, :create, :show]

end
