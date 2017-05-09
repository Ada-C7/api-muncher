Rails.application.routes.draw do
  root 'homepages#index'

  resources :recipes, only: [:index]
  get 'recipe/:name', to: 'recipes#show', as: 'recipe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
