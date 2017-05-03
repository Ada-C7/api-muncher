Rails.application.routes.draw do
  get 'homepages/index'

  get 'homepages/show'

  root 'homepages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
