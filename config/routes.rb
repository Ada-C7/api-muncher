Rails.application.routes.draw do

  root 'searches#new'

  post '/results', to: 'searches#results' , as: 'results'

end
