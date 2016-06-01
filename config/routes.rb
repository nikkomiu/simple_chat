Rails.application.routes.draw do
  root 'teams#index'

  resources :teams
  resources :folders, path: 'folders'
  resources :rooms, except: [:index]
end
