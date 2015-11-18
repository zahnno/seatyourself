Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :restaurants do
   resources :reservations, only: [:show. :create, :destroy]
   end
   resources :users, only: [:new, :create, :show] do
     resources :reservations, only: [:show, :create, :destroy] 
   end
end
