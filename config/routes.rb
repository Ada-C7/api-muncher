Rails.application.routes.draw do
  root 'recipes#home'
  get '/recipes/page/:page', to: 'recipes#index', defaults: {page: 1}, as: 'recipes'
  get '/recipes/:index', to: 'recipes#show', as: 'recipe'
end
