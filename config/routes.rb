Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "recipes#welcome"

    get "/auth/:provider/callback", to: "sessions#create"
    post '/logout', to: 'sessions#logout', as: 'logout'
    resources :users, only: [:show]

    get "/recipes/view_recipes" , to: "recipes#view_recipes", as: "view_recipes"
    get "/recipes/show_recipe/:uri", to: "recipes#show_recipe", as: "show_recipe"
    resources :recipes, only: [:new, :create, :destroy]

end
