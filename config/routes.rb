Wordy::Application.routes.draw do
  devise_for :users
  resources :wordlists, only: [:create, :destroy]
  resources :words 
  resources :users
  resources :quizzes
  resources :questions do
    get 'answer'
    patch 'grade'
    get 'results'
  end
  
  get '/ngsl/:name', to: 'lists#sys_list', as: 'sys_list'
  
  get '/word-tool', to: 'tools#new', as: 'word_tool'
  post '/word-tool', to: 'tools#create'
  get '/dictionary', to: 'words#index'
  get '/dictionary/:name', to: 'words#show', as: 'definition'
  root 'words#index'

  devise_scope :user do
    get '/signup', to: "devise/registrations#new"
    get '/signin', to: "devise/sessions#new"
    post '/signin', to: "devise/sessions#create"
    delete '/signout', to: "devise/sessions/#delete"
  end

end
