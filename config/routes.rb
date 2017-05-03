Rails.application.routes.draw do

  get 'search', to: 'recipes#search', as: 'recipe_search'
  get 'recipes', to: 'recipes#index', as: 'recipes'
  resources :recipes, only: [:show]

end
