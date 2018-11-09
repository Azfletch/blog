Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: [:index, :show] do
    resources :comments, only: [:create]
  end

  namespace :admin do
    root "dashboard#index"
    resources :articles
  end

  resources :notifications, only: [:new, :create]
end
