Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "search#index"

  get '/recipes/show', to: 'recipes#show', as: "recipe_path"

  get '/recipes', to: 'recipes#index', as: "recipes_path"

end
