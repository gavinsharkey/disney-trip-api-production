Rails.application.routes.draw do
  resources :trips do
    resources :days, only: [:index, :create]
  end

  resources :days, only: [:show, :update, :destroy]

  resources :resorts, only: [:index] do
    resources :restaurants, only: [:index]
  end

  resources :parks, only: [:index] do
    resources :restaurants, only: [:index]
    resources :attractions, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
