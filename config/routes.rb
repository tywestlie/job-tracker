Rails.application.routes.draw do

  resources :jobs, only: [:create, :new]


  resources :companies, :categories, shallow: true do
    resources :jobs, shallow: true do
      resources :comments, only: [:create, :new]
    end
  end
end
