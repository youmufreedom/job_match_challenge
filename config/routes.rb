require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "jobseekers#index"
  root 'home#index'

  resources :jobseekers, only: [:index, :show]
  resources :jobs
end
