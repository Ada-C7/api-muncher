Rails.application.routes.draw do
  root 'searches#index'

  get '/searches/show', to: 'searches#show', as: 'show'

  # when I was trying to make pages myself
  # post '/searches', to: 'searches#pagination', as: 'page'
end
