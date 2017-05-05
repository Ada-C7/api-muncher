# require 'edamam_api_wrapper'
require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe_result'


class SearchesController < ApplicationController
  before_action :check_next_and_prev

  def index
    session[:search_count] = nil
    session[:search_terms] = nil
    session[:from] = 0
    session[:to] = 10
    session[:health] = nil
  end

  def recipes
    session[:search_terms] ||= params[:search_terms]
    if %w(vegetarian dairy-free kosher gluten-free).include?(params[:health])
      session[:health] = params[:health]
    end
    if session[:health] != nil
      @results = EdamamApiWrapper.querySearch(session[:search_terms], session[:from], session[:to], session[:health])
    else
      @results = EdamamApiWrapper.querySearch(session[:search_terms], session[:from], session[:to])
    end
    session[:search_count] = @results.last
    @results = @results[0..-2]
  end

  def recipe
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
    # raise
    @nutrients = %w(ENERC_KCAL FAT SUGAR PROCNT VITB12)
    session[:recipe_name] = @recipe.name
    session[:recipe_url] = @recipe.recipe_url
  end

  # do I need this at all?
  def new; end

  def create
    @search = Search.new(search_terms: session[:search_terms], user_id: current_user.id)
    # @search.user_id = session[:user_id]
    if @search.save
      flash.now[:success] = "Successfully saved search #{session[:search_terms]}"
      redirect_to account_path
    else
      flash.now[:failure] = "Unable to save search"
      redirect_to :root
    end

  end

  # do I need this either?
  def destroy
    Search.find_by_id(params[:id]).destroy
    redirect_to account_path
  end

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
    params.require(:search).permit(:search_terms, :health)
  end

end
