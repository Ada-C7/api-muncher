Rails.application.routes.draw do
  root 'recipes#index'

  post 'recipes/results', to: 'recipes#results', as: 'recipes_results'

  get 'recipes/:recipe_id', to: 'recipes#show', as: 'show_recipe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
