Rails.application.routes.draw do


  devise_for :users
  resources :users, only: [:update]
   
   resources :topics, :posts, :comments do
   resources :posts, except: [:index]
   resources :comments, only: [:create]
 end


get 'about' => 'welcome#about'

 authenticated :user do
   root to: 'topics#index', as: 'authenticated_root'
 end

  root to: 'welcome#index'
end