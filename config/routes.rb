Rails.application.routes.draw do

  root 'search#index'

  get 'results/index', to: 'results#index', as: 'results'

end
