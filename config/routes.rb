Wordy::Application.routes.draw do
  resources :words, :users
  match '/dictionary', to: 'words#index', via: 'get'
  get '/dictionary/:name', to: 'words#show', as: 'definition'
  root 'words#index'

end
