Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users

  root to: "welcome#index"
  resources :categories do
  resources :records, only: [:new, :show]
  end
  resources :records, except: [:new, :show, :index]
  # Defines the root path route ("/")
  # root "posts#index"
end
