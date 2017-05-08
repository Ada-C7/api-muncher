Rails.application.routes.draw do
  root 'searches#index'
  get '/searches/show', to: 'searches#show', as: 'show'
end
