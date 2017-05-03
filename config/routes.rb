Rails.application.routes.draw do
  root 'home#index'
  get '/recipes/:search', to: 'recipes#index'
end
