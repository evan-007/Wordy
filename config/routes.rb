Wordy::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :wordlists, only: [:create, :destroy]
  resources :words 
  resources :users, only: [:show] do
    get 'map'
  end
  resources :lists
  resources :quizzes do
    get 'results'
    get 'review'
  end
  resources :questions do
    get 'answer'
    patch 'grade'
  end
  
  get '/ngsl/:name', to: 'lists#sys_list', as: 'sys_list'
  
  get '/word-tool', to: 'tools#report', as: 'word_tool'
  post '/word-tool', to: 'tools#results'
  get '/word-tool/results', to: 'tools#results', as: 'word_tool_results'
  get '/dictionary', to: 'words#index'
  get '/dictionary/:name', to: 'words#show', as: 'definition'
  root 'static_pages#welcome'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  devise_scope :user do
    get '/signup', to: "devise/registrations#new"
    get '/signin', to: "devise/sessions#new"
    post '/signin', to: "devise/sessions#create"
    delete '/signout', to: "devise/sessions/#delete"
  end
  
  match "/delayed_job" => DelayedJobWeb, anchor: false, via: [:get, :post]


end
