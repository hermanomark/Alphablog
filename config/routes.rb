Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'alphablogs#index'
  get '/home', to: 'alphablogs#index'
  get '/about', to: 'alphablogs#about'

  resources :articles
end
