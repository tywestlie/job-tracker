Rails.application.routes.draw do
  
  resources :jobs, only: [:create, :new]

  resources :categories, shallow: true do
    resources :jobs
  end

  resources :companies, shallow: true do
    resources :jobs, shallow: true do
      resources :comments, only: :create
    end
  end
end
