Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [ :show, :index, :edit, :update] do 
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'follower' => 'relationships#followers', as: 'followers'
  end 
  
  get '/search', to: 'searches#search'
end
