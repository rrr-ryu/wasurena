Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'  
  resources :user_rooms, only: [:update, :show, :destroy]
  post 'user_rooms/:id', to: 'user_rooms#create'
  resources :rooms do
    resources :teams
    resources :pickups
    resources :students
    put 'students/:id/update', to: 'students#update_edit'
    put 'students/ride/reset', to: 'students#reset_ride'
    put 'students/attend/reset', to:'students#reset_attend'
  end
end
