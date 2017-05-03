Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "recepies#welcome"
    get "/recepies/view_recepies" , to: "recepies#view_recepies", as: "view_recepies"
    # get "/recepies/:from" , to: "recepies#view_recepies", as: "view_recepies"

    get "show_recipe/:uri", to: "recepies#show_recipe", as: "show_recipe"
    resources :recepies


end
