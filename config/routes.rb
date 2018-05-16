Rails.application.routes.draw do
  get '/dashboard', to:'dashboard#index', as: 'dashboard'

  resources :companies, :categories, shallow: true do
    resources :jobs, shallow: true do
      resources :comments, only: [:create, :new]
    end
  end

  resources :jobs, only: [:create, :new]
end
