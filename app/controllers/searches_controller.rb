# require 'edamam_api_wrapper'
require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe_result'


class SearchesController < ApplicationController
  # before_action :check_next_and_prev

  # after_action :set_from_and_to, only: [:prev_ten, :next_ten]
  def index
    session[:search_count] = nil
    session[:search_terms] = nil
    session[:from] = 0
    session[:to] = 10
  end

  def recipes
    check_next_and_prev
    # raise
    session[:search_terms] ||= params[:search_terms]
    @results = EdamamApiWrapper.querySearch(session[:search_terms], session[:from], session[:to])
    session[:search_count] = @results.first
    @results = @results[1..-1]
    # raise
    # ADD BACK IN: params[:gluten], params[:dairy], params[:vegetarian], params[:kosher]
    # raise
  end

  def recipe
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
    # raise
    @nutrients = %w(ENERC_KCAL FAT SUGAR PROCNT VITB12)
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new
    # @search.user_id = session[:user_id]
    if @search.create(search_params)
      flash[:success] = "Successfully saved search #{params[:search_terms]}"
      redirect_to :root
    else
      flash[:failure] = "Unable to save search"
      redirect_to :root
    end

  end

  def destroy; end

  private

  # def set_from_and_to
  #   session[:from] ||= 0
  #   session[:to] = session[:from] + 9
  # end

  def check_next_and_prev
    if params[:prev] == "true"
      if session[:from] - 10 >= 0
        session[:from] -= 10
        session[:to] -= 10

      end
      params[:prev] = nil
    end

    if params[:next] == "true"
      # raise
      if session[:to] + 10 <= session[:search_count]
        session[:to] += 10
        session[:from] += 10

      end
      params[:next] = nil
    end
  end

  def search_params
    params.require(:search).permit(:search_terms, :gluten, :dairy, :vegetarian, :kosher)
  end

end
