Rails.application.routes.draw do

     get 'recipes', to: 'recipes#index', as: 'recipes'
     get 'recipes/:id', to: 'recipes#show', as: 'recipe'

end
