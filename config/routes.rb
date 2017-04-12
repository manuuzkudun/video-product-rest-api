Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    resources :movies, only: [:index]
    resources :seasons, only: [:index]
    resources :video_products, only: [:index]
    resources :purchases, only: [:create]
    resources :users, only: [:show] do
      resources :library, only: [:index]
    end
  end
end
