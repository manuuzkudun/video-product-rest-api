Rails.application.routes.draw do
  get 'seasons/index'

  resources :movies, only: [:index]
  resources :seasons, only: [:index]
end
