Rails.application.routes.draw do

  resources :recipes only: [:index, :create, :show]
  get 'recipes/search', to: 'recipes#search', as: 'recipe_search'

end
