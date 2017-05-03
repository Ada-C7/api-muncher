Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'homepages#index'

# goes to the results list page
get 'recipes/', to: 'recipes#index', as: 'recipes'

# goes to the result show page

get 'recipe/:name', to: 'recipes#show', as: 'recipe'

end
