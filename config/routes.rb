Rails.application.routes.draw do

root to: 'recipes#index'

get 'recipes', to: 'recipes#index', as: 'recipes'
get 'recipes/show', to: 'recipes#show', as: 'recipe'

end
