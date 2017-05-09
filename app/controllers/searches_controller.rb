# require 'edamam_api_wrapper'
require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe_result'
require_dependency '../../lib/recent_search'



class SearchesController < ApplicationController
  before_action :check_next_and_prev, only: [:recipes]
  before_action :limit_recent_searches

  def index
    @recent_searches = session[:recent_searches]
    session[:search_count] = nil
    session[:search_terms] = nil
    session[:from] = 0
    session[:to] = 12
    session[:health] = nil
    # raise
  end

  def recipes
    session[:search_terms] ||= params[:search_terms]
    if ["vegetarian", "balanced", "peanut-free", "high-protein"].include?(params[:health])
      session[:health] = params[:health]
    end
    if session[:health] != nil
      @results = EdamamApiWrapper.querySearch(session[:search_terms], session[:from], session[:to], session[:health])
    else
      @results = EdamamApiWrapper.querySearch(session[:search_terms], session[:from], session[:to])
    end
    if !@results.empty?
      session[:search_count] = @results.last # get the count for the session
      @results = @results[0..-2]
      if session[:recent_searches].last != @results.last
        session[:recent_searches] << @results.last #shovel the search into the list
      end
      @results = @results[0..-2]
      # raise
    end

  end

  def recipe
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
    @nutrients = %w(ENERC_KCAL FAT SUGAR PROCNT VITB12)
    session[:recipe_name] = @recipe.name
    session[:recipe_url] = @recipe.recipe_url
  end

  # do I need this at all?
  def new; end

  def create
    @search = Search.new(search_terms: session[:search_terms], user_id: current_user.id, health: session[:health])
    # @search.user_id = session[:user_id]
    if @search.save
      flash.now[:success] = "Successfully saved search #{session[:search_terms]} (#{session[:health]})"
      redirect_to account_path
    else
      flash.now[:failure] = "Unable to save search"
      redirect_to :root
    end

  end

  def destroy
    Search.find_by_id(params[:id]).destroy
    redirect_to account_path
  end

  private

  def check_next_and_prev
    if params[:prev] == "true"
      if session[:from] - 12 >= 0
        session[:from] -= 12
        session[:to] -= 12
      end
      redirect_to recipes_path
    end

    if params[:next] == "true"
      if session[:to] + 12 <= session[:search_count]
        session[:to] += 12
        session[:from] += 12
      end
      redirect_to recipes_path
    end
  end

  def search_params
    params.require(:search).permit(:search_terms, :health)
  end

  def limit_recent_searches
    session[:recent_searches] ||= []
    if session[:recent_searches].length > 10
      session[:recent_searches] = session[:recent_searches][-10..-1]
    end
  end


end
