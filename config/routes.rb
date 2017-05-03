Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepages#root'

  get '/recipes', to: 'homepages#index', as: 'search_recipes'
end
