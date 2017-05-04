Rails.application.routes.draw do
  root 'homepages#index'

  get '/recipes', to: 'homepages#list', as: 'list_recipes'
end
