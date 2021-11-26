Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: :destroy
  resources :bookings, only: %i[update]

  get "dashboard", to: "pages#dashboard"

  get "dashboard/myplants", to: "pages#dashboard_my_plants"
end
