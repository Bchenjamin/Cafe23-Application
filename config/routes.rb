Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
      
  # provide the routes for the API here
  resources :sessions
  resources :employees
  resources :stores, except: [:destroy]
  resources :assignments
  resources :jobs, except: [:show]
  resources :pay_grade_rates, except: [:index, :show, :edit, :update, :destroy]
  resources :pay_grades, except: [:destroy]
  resources :shift_jobs, except: [:index, :show, :edit, :update]
  resources :shifts
  

  # Time Clock Routes
  patch 'time_in', to: 'shifts#time_in', as: :time_in
  patch 'time_out', to: 'shifts#time_out', as: :time_out
  get 'time_clock', to: 'shifts#time_clock', as: :time_clock



      

  # Routes for regular HTML views go here...
  








  # You can have the root of your site routed with 'root'
  
  
end
