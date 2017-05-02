class RecepiesController < ApplicationController

  # def search
  #
  # end

  def index
    if params[:search]
      @recepies = Recipe.search(params[:search])
    end
  end




end
