Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :workouts
  resources :exercises
end
