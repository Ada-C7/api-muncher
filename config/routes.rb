Rails.application.routes.draw do

  root 'recipes#search'

  get 'recipes/:search_term', to: 'recipes#index', as: 'recipes'

  get '/recipes/:search_term/:recipe', to: 'recipes#show', as: 'recipe'

end
