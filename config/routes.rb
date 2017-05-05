Rails.application.routes.draw do
  root 'recipes#new'
  resources :recipes
end
