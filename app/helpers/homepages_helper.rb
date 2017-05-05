module HomepagesHelper
  def previous_link
    if !params[:page]
      page = 1
    else
      page = params[:page].to_i
    end

    if page == 1
      @previous_link = ""
    else
      @previous_link = "<a class=\"button\" href=\"" + list_recipes_path(:search_term => params[:search_term], :page => page - 1) + "\">Previous</a>"
    end
  end

  def next_link
    if !params[:page]
      page = 1
    else
      page = params[:page].to_i
    end
    
    if @recipes.length < 10
      @next_link = ""
    else
      @next_link = "<a class=\"button\" href=\"" + list_recipes_path(:search_term => params[:search_term], :page => page + 1) + "\">Next</a>"
    end
  end
end
