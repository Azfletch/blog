Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  namespace :admin do
    resources :articles
    resources :comments
  end
end
