Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'searches#index'

  get '/recipes', to: 'searches#recipes', as: 'recipes'
  get '/recipe', to: 'searches#recipe', as: 'recipe'

  get '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#logout', as: 'logout'
  resources :users, only: [:new, :create]

end
