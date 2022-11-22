Rails.application.routes.draw do

  namespace :user do
   resources :users
  end
  resources :bookings
  resources :meetingrooms
  root "home#index"
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
