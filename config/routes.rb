Rails.application.routes.draw do

	mount MadChatter::RailsEngine => "/chat"		
	
  root to: "pages#index"
  
  devise_for :users

  resources :articles
   
end
