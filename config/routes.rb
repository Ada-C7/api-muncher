Rails.application.routes.draw do

root to: 'recipes#search'

# get 'recipes/:key_word', to: 'recipes#index', as: 'recipes'
get 'recipes/:uri', to: 'recipes#show', as: 'recipe'
get 'recipes/', to: 'recipes#search', as: 'search'
get 'recipes/:from/:to', to: 'recipes#list', as: 'list'

end
