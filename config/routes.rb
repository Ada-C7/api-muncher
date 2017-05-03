Rails.application.routes.draw do
  root to: "recipes#index"
  # get 'recipes', to: 'recipes#index', as: 'recipes'
  post '/', to:'recipes#search'
end
