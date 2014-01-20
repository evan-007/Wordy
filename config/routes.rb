Wordy::Application.routes.draw do
  resources :wordlists, only: [:create, :destroy]
  resources :words 
  resources :users do
  	resources :lists
  end
  
  get '/word-tool', to: 'tools#new', as: 'word_tool'
  post '/word-tool', to: 'tools#create'
  get '/dictionary', to: 'words#index'
  get '/dictionary/:name', to: 'words#show', as: 'definition'
  root 'words#index'
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"

end
