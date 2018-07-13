Rails.application.routes.draw do
  root "welcome#index"

  get "welcome/index"

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :articles, :comments
  end
end
