Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
   
   resources :topics do
     resources :posts, except: [:index]
   end


get 'about' => 'welcome#about'

 authenticated :user do
   root to: 'topics#index', as: 'authenticated_root'
 end

  root to: 'welcome#index'
end