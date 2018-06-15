module ApplicationHelper
  def articles_for_sidebar
    Article.all
  end
end
