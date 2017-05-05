Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "search#index"

  get '/recipes/show', to: 'recipes#show', as: "recipe_path"

  post '/recipes', to: 'recipes#index', as: "recipes_path"

  get "/auth/:provider/callback", to: "users#create"

  get 'signout', to: "users#destroy", as: 'signout'

  resources :users, only: [:create, :destroy]

end
