Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  get 'recipes/index'
  get 'recipes/:id', to: 'recipes#show', as: 'recipes_show'
end
