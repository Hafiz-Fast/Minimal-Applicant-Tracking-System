Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :jobs do
    resources :job_applications, only: [:create]
  end

  resources :job_applications, only: [:index, :show]
end
