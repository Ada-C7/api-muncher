Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'recipes#root'

get '/recipes', to: 'recipes#index', as: 'recipes'
post '/recipes', to: 'recipes#index'
get '/recipes/:uri', to: 'recipes#show', as: 'recipe'

end
