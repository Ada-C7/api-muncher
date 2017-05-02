Rails.application.routes.draw do

  get 'recipes/search', to: 'recipes#search', as: 'recipe_search'
  post 'recipes/search/get_results', to: 'recipes#create', as: 'get_results'
  resources :recipes, only: [:index, :create, :show]


end
