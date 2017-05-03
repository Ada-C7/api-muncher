Rails.application.routes.draw do

  root 'recipes#search', as:'root'

  get '/recipes', to: 'recipes#index', as: 'recipes'

#show - only one
  #get '/recipes/:id'#what the unique identifier is on API#, to: 'recipes#get_recipes', as: 'get_recipes'
end
