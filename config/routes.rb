Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "recepies#welcome"
    get "/recepies/view_recepies" , to: "recepies#view_recepies", as: "view_recepies"
    # get "/recepies/:from" , to: "recepies#view_recepies", as: "view_recepies"
    resources :recepies
end
