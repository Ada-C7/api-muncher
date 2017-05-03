Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#search'
end


# def root
#   @albums = Work.best_albums
#   @books = Work.best_books
#   @movies = Work.best_movies
#   @best_work = Work.order(vote_count: :desc).first
# end
