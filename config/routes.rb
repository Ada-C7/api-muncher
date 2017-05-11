Rails.application.routes.draw do
  get '/recipes', to: 'recipes#search_show', as: 'search_show'
  get '/recipes/search', to: 'recipes#search', as: 'search'
  #/search doesn't need to be /:search because of the form_tag which passes it in on its own
  get '/recipes/:uri', to: 'recipes#show_recipe', as: 'show_recipe'
end
