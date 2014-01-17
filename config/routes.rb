Wordy::Application.routes.draw do
  resources :words
  match '/dictionary', to: 'words#index', via: 'get'
  get '/dictionary/:name', to: 'words#show', as: 'definition'

end
