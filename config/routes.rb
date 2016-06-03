Rails.application.routes.draw do
  root 'teams#index'

  resources :teams, param: :path do
    resources :folders, param: :path
  end
  resources :rooms, except: [:index]
end
