Rails.application.routes.draw do

root to: 'recipes#search'

# get 'recipes/:key_word', to: 'recipes#index', as: 'recipes'
get 'recipes/:key_word/:index/show', to: 'recipes#show', as: 'recipe'
get 'recipes/', to: 'recipes#search', as: 'search'
post 'recipes/', to: 'recipes#list', as: 'list'

end
