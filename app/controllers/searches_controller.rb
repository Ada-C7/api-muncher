# require 'edamam_api_wrapper'
require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe_result'


class SearchesController < ApplicationController
  before_action :set_from_and_to
  def index
  end

  def recipes
    @results = EdamamApiWrapper.querySearch(params[:search_terms], params[:from], params[:to])
    session[:search_count] = @results.first
    @results = @results[1..-1]
    raise
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

  def destroy
  end

  private

  def next_ten
    params[:from] += 10
  end

  def prev_ten
    if params[:from] >= 10
      params[:from] -= 10
    end
  end

  def set_from_and_to
    params[:from] ||= 0
    params[:to] ||= params[:from] + 9
  end

  def search_params
    params.require(:search).permit(:search_terms, :gluten, :dairy, :vegetarian, :kosher)
  end

end
