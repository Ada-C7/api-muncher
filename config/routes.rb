Rails.application.routes.draw do

  root 'recipes#search'

  get '/:search_term', to: 'recipes#index', as: 'recipes'

  get '/:search_term/:recipe', to: 'recipes#show', as: 'recipe'

end
