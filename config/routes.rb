Rails.application.routes.draw do
  root 'recipes#index'

  get 'recipes/:recipe_id', to: 'recipes#show', as: 'show_recipe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
