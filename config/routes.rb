Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'alphablogs#index'
  get '/home', to: 'alphablogs#index'
  get '/about', to: 'alphablogs#about'

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  # other to do the users_path post, but we already made the users#new path hence the except
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 

  resources :articles

  # we don't want to have the delete action
  resources :categories, except: [:destroy]
end
