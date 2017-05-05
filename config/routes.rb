Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'searches#index'

  get '/recipes', to: 'searches#recipes', as: 'recipes'
  get '/recipe', to: 'searches#recipe', as: 'recipe'
  get '/recipes', to: 'searches#recipes', as: 'next'
  get '/', to: 'searches#recipes', as: 'prev'

  post '/recipes/save_search', to: 'searches#create', as: 'save_search'
  delete '/searches/:id', to: 'searches#destroy', as: 'delete_search'


  post '/recipes/save_recipe', to: 'recipes#create', as: 'save_recipe'
  delete '/recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'



  get '/login', to: 'sessions#login', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#logout', as: 'logout'


  get '/account', to: 'users#account', as: 'account'
end
