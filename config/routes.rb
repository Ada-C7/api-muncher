Rails.application.routes.draw do
    root 'homepages#root'

    get '/recipes/:page_num', to: 'recipes#index', as: 'recipes'
    get '/recipes/:uri/show', to: 'recipes#show', as: 'recipe'
end
