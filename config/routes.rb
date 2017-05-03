Rails.application.routes.draw do
  get 'recipes/search', to: "recipes#search", as: "recipe_search"
  post 'recipes/search', to: "recipes#search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
