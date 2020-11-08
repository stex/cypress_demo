Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "posts#index"

  resources :posts do
    resource :like, only: [:create, :destroy]
  end
  resource :session, only: [:new, :create, :destroy]
end
