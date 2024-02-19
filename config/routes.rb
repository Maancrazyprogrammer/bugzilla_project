require 'sidekiq/web'

Rails.application.routes.draw do
  get 'errors/not_found'
  root 'projects#index'

  # config/routes.rb
  # resources :projects do
  #   member do
  #     delete 'remove_user/:user_id', action: :remove_user, as: :remove_user
  #   end
  # end


resources :projects do
  resources :joins, only: [:new, :create]
end
resources :projects do
  resources :bugs, only: [:new, :create]
  get 'project_bugs_path', to: 'projects#project_bugs_path', on: :member
end
  resources :projects
  resources :bugs
  resources :joins
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => '/sidekiq'
  # Defines the root path route ("/")
  # root "posts#index"
  match '*path', to: 'errors#not_found', via: :all
end
