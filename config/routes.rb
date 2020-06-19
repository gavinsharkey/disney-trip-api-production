Rails.application.routes.draw do
  resources :trips do
    resources :days, only: [:index, :create]
  end

  resources :days, only: [:show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
