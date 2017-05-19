Rails.application.routes.draw do
  root 'recipes#new'

<<<<<<< HEAD

get 'recipes', to: 'recipes#index', as: 'recipes'

=======
  get 'recipes/', to: 'recipes#index', as: 'recipes'
>>>>>>> paging

  get 'recipes/:name', to: 'recipes#show', as: 'recipe'
end
