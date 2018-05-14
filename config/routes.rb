Rails.application.routes.draw do

  resources :companies, shallow: true do
    resources :jobs
  end

end
