Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'

  get 'recipes', to: 'recipes#search', as: 'recipes'
  post 'recipes', to: 'recipes#search'

  get '/recipes/:recipe', to: 'recipes#show_recipe', as: 'show_recipe'

end
