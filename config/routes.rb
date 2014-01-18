Wordy::Application.routes.draw do
  resources :words 
  resources :users do
  	resources :lists
  end
  
  match '/dictionary', to: 'words#index', via: 'get'
  get '/dictionary/:name', to: 'words#show', as: 'definition'
  root 'words#index'
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"

end
