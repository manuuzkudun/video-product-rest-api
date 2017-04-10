Rails.application.routes.draw do
  get 'movies/index'

  resources :movies, only: [:index]
end
