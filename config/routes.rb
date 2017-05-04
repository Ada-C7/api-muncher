Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepages#search'
  get '/recipes', to: 'homepages#list', as: 'result_list'
  get '/recipe', to: "homepages#show", as: 'recipe_details'

end
