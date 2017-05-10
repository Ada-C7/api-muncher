Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'recipes#search'

  get 'recipes/search' => 'recipes#search', as: 'search'

  get 'recipes/index' => 'recipes#index', as: 'index'

  get 'recipes/show/*uri' => 'recipes#show', as: 'show'

end
