Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homepages#index"

  get 'homepages/index', to: 'homepages#index'
  get 'homepages/show', to: 'homepages#show'

  get 'recipes/show', to: 'recipes#show'
  get 'recipes', to: 'recipes#show', as: 'recipe'
  #resources :recipes
end
