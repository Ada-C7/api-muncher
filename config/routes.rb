Rails.application.routes.draw do

# get 'sessions/create'
# get 'sessions/destroy'
# get 'home/show'
get 'auth/:provider/callback', to: 'sessions#create'
get 'auth/failure', to: redirect('/')
get 'signout', to: 'sessions#destroy', as: 'signout'

resources :sessions, only: [:crete, :destroy]
# resource :home, only [:show]

root to: 'recipes#search'

# get 'recipes/:key_word', to: 'recipes#index', as: 'recipes'
get 'recipes/:uri', to: 'recipes#show', as: 'recipe'
get 'recipes/', to: 'recipes#search', as: 'search'
get 'recipes/:from/:to', to: 'recipes#list', as: 'list'

end
