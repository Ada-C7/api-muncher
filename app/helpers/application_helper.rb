module ApplicationHelper
  
  def where_to_start(i)
    return i * @per_page
  end
end
