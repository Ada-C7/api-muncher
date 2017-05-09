Rails.application.routes.draw do
    root 'homepages#root'

    get '/recipes/show', to: 'recipes#show', as: 'recipe'
    get '/recipes/:page_num/index', to: 'recipes#index', as: 'recipes'
end
