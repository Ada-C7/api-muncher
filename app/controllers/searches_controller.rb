require "edamam"
require "result"


class SearchesController < ApplicationController
  def index
    @all_search_results = Edamam.all_search(params[:search_item])
    if params[:search_item]
      @page_results = @all_search_results.paginate(:page => params[:page], :per_page => 10)
      # w/o if get this error The @searches variable appears to be empty.
      # Did you forget to pass the collection object for will_paginate?
    end
  end

  def show
    @one_result = Edamam.show_one_result(params[:uri])
  end
end


  #### Caved and used gem ####
  # ATTEMPT
  # def pagination
  #   @all_search_results = Edamam.all_search(params[:search_item], params[:from], params[:to])
  #   @from = params[:from].to_i
  #   @to = params[:to].to_i

  # @total = []
  # @total << @all_search_results
  #
  #   return @all_search_results
  # end
  # this was in index.html.erb
  #  <%= link_to "Next", root_path(search_item: params[:search_item], from: (@from += 10).to_s, to: (@to += 10).to_s), method: :post %>
