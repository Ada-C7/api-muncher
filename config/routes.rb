Rails.application.routes.draw do

  post 'results', to: 'recipes#search_results', as: 'get_results'
  get 'search', to: 'recipes#search', as: 'recipe_search'
  get 'recipes/:search_text', to: 'recipes#index', as: 'recipes'
  resources :recipes, only: [:show]


end
