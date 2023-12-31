Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  
   # Time Clock Routes
   patch 'time_in', to: 'shifts#time_in', as: :time_in
   patch 'time_out', to: 'shifts#time_out', as: :time_out
   get 'time_clock', to: 'shifts#time_clock', as: :time_clock
  
   # Payroll Routes
   get 'payrolls/store_form', to: 'payrolls#store_form', as: :store_form
   get 'payrolls/employee_form', to: 'payrolls#employee_form', as: :employee_form
   get 'payrolls/employee_payroll', to: 'payrolls#employee_report', as: :employee_payroll
   get 'payrolls/store_payroll', to: 'payrolls#store_report', as: :store_payroll
 
   # Semi-static page routes
   get 'contact', to: 'home#contact', as: :contact
   get 'about', to: 'home#about', as: :about
   get 'privacy', to: 'home#privacy', as: :privacy
   root 'home#index', as: :home

  resources :employees
  resources :stores, except: [:destroy]
  resources :sessions
  resources :assignments
  resources :jobs, except: [:show]
  resources :pay_grade_rates, except: [:index, :show, :edit, :update, :destroy]
  resources :pay_grades, except: [:destroy]
  resources :shift_jobs, except: [:index, :show, :edit, :update]
  resources :shifts
  


  # Routes for regular HTML views go here...
  
  
  
end
