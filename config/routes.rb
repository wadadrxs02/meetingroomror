Rails.application.routes.draw do
  # get 'home/index'
  # get "partial/index"
  resources :bookings
  resources :meetingrooms
  resources :users
  # get 'home/index'
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  devise_scope :admin do
    authenticated :admin do
      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
