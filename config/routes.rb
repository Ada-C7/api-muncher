Rails.application.routes.draw do

  get 'recipes/search', to: 'recipes#search', as: 'recipe_search'
  resources :recipes, only: [:index, :create, :show]

end
