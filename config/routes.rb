Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  end

  resources :users, only: [:create, :show, :index, :edit, :update]
end