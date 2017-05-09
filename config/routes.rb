Rails.application.routes.draw do
  root 'recipes#search'

  get '/search', to: 'recipes#search'

  get '/index', to: 'recipes#index', as: 'list_recipes'

  get '/show/*uri', to: 'recipes#show', format: false, as: 'show'

end
