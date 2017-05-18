module HomepagesHelper
  def previous_recipe(params)
    if params[:page].to_i > 1
      link_to "Previous", result_list_path(:page => (params[:page].to_i - 1).to_s, :q => params[:q]), method: :get, class:"button"
    end
  end

  def paginate_recipe(params, page_range)
    if page_range["to"] < page_range["count"]
      link_to "Next", result_list_path(:page => (params[:page].to_i + 1).to_s, :q => params[:q]), method: :get, class:"button"
    end
  end
end
