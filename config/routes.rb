Rails.application.routes.draw do

  root 'search#index'

  get 'results/index', to: 'results#index', as: 'results'

  get 'ingredients/show', to: 'ingredients#show', as: 'ingredients'

end
