require "edamam"

class SearchesController < ApplicationController
  def index
    @all_search_results = Edamam.all_search(params[:search_item])
    # Restarted server, now working... yay!
      #(given 1, expect 0)
    # @all_search_results = Edamam.new(params[:search_item]).all_search
      #(given 0, expect 1)
  end

  def show
    @one_result = Edamam.show_one_result(params[:uri])
  end
end
