Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items do
    resources :rentals, only: [:index, :show, :new, :create, :destroy]
  end

  resources :rentals, only: [] do
    resources :reviews, only: [:new, :create]
  end
end
