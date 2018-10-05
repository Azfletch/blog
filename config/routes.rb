Rails.application.routes.draw do
  get 'users/new'
  root "welcome#index"

  get "welcome/index"

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    get '/', action: :index
    resources :articles, :comments
  end

  resources :notifications
end
