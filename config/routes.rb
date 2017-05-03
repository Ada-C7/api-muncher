Rails.application.routes.draw do

  root 'search#index'

  get ':recipe/index', to: 'homepages#index', as: 'index_recipe'

  post ':recipe', to: 'homepages#create', as: 'create_message'

end
