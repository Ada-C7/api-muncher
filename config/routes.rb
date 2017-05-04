Rails.application.routes.draw do

  get 'search', to: 'recipes#search', as: 'recipe_search'
  # get 'recipe/:id', to: 'recipes#show', as: 'recipe'
  resources :recipes, only: [:index, :show]

end
