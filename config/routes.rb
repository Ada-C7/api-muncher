Rails.application.routes.draw do
    root 'homepages#root'

    get '/recipes', to: 'recipes#index', as: 'recipes'
end
