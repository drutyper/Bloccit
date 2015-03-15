Rails.application.routes.draw do


  devise_for :users
  resources :users, only: [:update]
   
  resources :topics do
  	resources :posts, except: [:index] 
  end
    
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy]

      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
 	end


get 'about' => 'welcome#about'

 authenticated :user do
   root to: 'topics#index', as: 'authenticated_root'
 end

  root to: 'welcome#index'
end