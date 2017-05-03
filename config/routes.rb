Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homepages#index"

  get 'homepages/index', to: 'homepages#index'
  get 'homepages/show', to: 'homepages#show'

  get 'recipes/show', to: 'recipes#show' 
  #resources :recipes
end
