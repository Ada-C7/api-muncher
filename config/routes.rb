Rails.application.routes.draw do

  root 'searches#index'

  get 'results/index', to: 'results#index', as: 'results'

  get 'recipes/show', to: 'results#show', as: 'recipe'

end
