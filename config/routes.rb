Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'

  resources :rooms do
    resources :teams
    resources :pickups
    resources :students
  end
end
