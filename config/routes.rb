Wordy::Application.routes.draw do
  get "lists/show"
  get "lists/new"
  get "lists/create"
  get "lists/edit"
  get "lists/update"
  get "lists/destroy"
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
