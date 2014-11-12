Rails.application.routes.draw do
   
  devise_for :users
  resources :posts

  get 'about' => 'welcome#about'

 authenticated :user do
   root to: 'posts#index', as: 'authenticated_root'
 end

  root to: 'welcome#index'
end