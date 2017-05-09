Rails.application.routes.draw do

root to: 'recipes#search'

get 'auth/:provider/callback', to: 'sessions#create', as: 'signin'
get 'auth/failure', to: redirect('/')
get 'signout', to: 'sessions#destroy', as: 'signout'
get 'recipes/list', to: 'recipes#list', as: 'list'
get 'recipes/:uri', to: 'recipes#recipe', as: 'recipe'
get 'recipes/', to: 'recipes#search', as: 'search'

end
