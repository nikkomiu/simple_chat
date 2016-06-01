Rails.application.routes.draw do
  root 'teams#index'

  resources :teams
  resources :team_folders, path: 'folders'
  resources :rooms
end
