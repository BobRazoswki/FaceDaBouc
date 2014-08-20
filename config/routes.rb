Rails.application.routes.draw do

  root to: "pages#index"
  
  devise_for :users

  resources :articles

  resources :tags
   
end
