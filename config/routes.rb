Rails.application.routes.draw do
  root 'recipes#index'

  get '/recipes/', to: 'recipes#list', as: 'get_recipes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
