Rails.application.routes.draw do
  # get 'home/index'
  # get "partial/index"
  resources :bookings
  resources :meetingrooms
  resources :users
  # get 'home/index'
  devise_for :admins
  devise_scope :admin do
    authenticated :admin do
      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
