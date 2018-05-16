Rails.application.routes.draw do
  resources :companies, shallow: true do
    resources :jobs
  end

  resources :jobs, shallow: true do
    resources :comments
  end

  get '/dashboard', to:'dashboard#index', as: 'dashboard'
end
