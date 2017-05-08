module HomepagesHelper
  def previous_link
    if !params[:page]
      page = 1
    else
      page = params[:page].to_i
    end

    if page == 1
      @previous_link =   "<li class=\"pagination-previous disabled\">Previous</li>"
    else
      @previous_link = "<li class=\"pagination-previous\"><a href=\"" + list_recipes_path(:search_term => params[:search_term], :page => page - 1) + "\" aria-label=\"Previous page\">Previous</a></li>"
    end
  end

  def next_link
    if !params[:page]
      page = 1
    else
      page = params[:page].to_i
    end

    if @recipes.length < 10
      @next_link = "<li class=\"pagination-next disabled\">Next</li>"
    else
      @next_link = "<li class=\"pagination-next\"><a href=\"" + list_recipes_path(:search_term => params[:search_term], :page => page + 1) + "\" aria-label=\"Next page\">Next</a></li>"
    end
  end
end
