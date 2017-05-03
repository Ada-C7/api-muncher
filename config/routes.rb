Rails.application.routes.draw do
  root 'recipes#index'

  get '/recipes', to: 'recipes#recipes', as: 'get_recipes'

  get '/recipes/:uri', to: 'recipes#show', as: 'get_recipe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
