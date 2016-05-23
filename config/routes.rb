Rails.application.routes.draw do
  devise_for :users
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
      resources :reports, only: [:create, :destroy]


end
