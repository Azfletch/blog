module ApplicationHelper
  def articles_for_sidebar
    @articles ||= Article.all
  end
end
