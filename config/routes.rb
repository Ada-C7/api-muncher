Rails.application.routes.draw do

  root 'searches#new'
  get 'results/:id/:label', to: 'searches#filter_by_diet', as: "diet"
  get '/results/:id', to: 'searches#show', as: 'recipe' 

  get '/results', to: 'searches#results' , as: 'results'




end
