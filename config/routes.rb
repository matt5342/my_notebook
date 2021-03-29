Rails.application.routes.draw do
  resources :pages
  resources :chapters
  resources :notebooks
  get '/chapters/:id/pages', to: 'chapters#this_chapter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      get '/login', to: 'users#token_authenticate'
      post '/login', to: 'users#create'
      get '/profile', to: 'users#profile'
    end
  end
end
