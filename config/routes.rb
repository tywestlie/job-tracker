Rails.application.routes.draw do
  resources :jobs, only: [:create, :new]
  
  get '/dashboard', to:'dashboard#index', as: 'dashboard'
  
  resources :companies, :categories, shallow: true do
    resources :jobs, shallow: true do
      resources :comments, only: [:create, :new]
    end
  end
  
end
