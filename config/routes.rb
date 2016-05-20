Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
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
