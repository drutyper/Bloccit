Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :topics


 authenticated :user do
   root to: 'topics#index', as: 'authenticated_root'
 end

  root to: 'welcome#index'
end