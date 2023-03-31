Rails.application.routes.draw do
  get 'home', to: 'home#index', as: :home
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
      
  # provide the routes for the API here
  resources :sessions
  resources :employees
  resources :stores, except: [:destroy]
  resources :assignments

      
    

  # Routes for regular HTML views go here...
  








  # You can have the root of your site routed with 'root'
  
  
end
