Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'recipes#welcome'

get 'recipes/', to: 'recipes#index', as: 'recipes_search'


end
