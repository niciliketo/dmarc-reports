Rails.application.routes.draw do
  resources :policy_publisheds
  resources :records
  resources :reports
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'policy_publisheds#index'
end
