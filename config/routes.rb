Rails.application.routes.draw do

     root 'recipes#index'
     get 'recipes', to: 'recipes#index', as: 'recipes'
     get 'recipes/:id', to: 'recipes#show', as: 'recipe'

end
