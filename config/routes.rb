Rails.application.routes.draw do
root "recipes#index"

resources :recipes, only: [:index]
get "recipes/:label", to: "recipes#show", as: "recipe"


end
