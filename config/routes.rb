Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  #post 'books' => 'books#create'

  resources :users, only: [:show, :edit, :index, :update]
  #patch 'users/:id' => 'users#update', as:'update_user'


end
