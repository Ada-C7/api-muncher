Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#search'
  get '/search', to: 'recipes#search', as: 'search'
  post '/results', to: 'recipes#results', as: 'results'
  get '/results/:recipe', to: 'recipes#show', as: "recipe"

end
