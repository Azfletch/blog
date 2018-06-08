require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "should not save article with text in body" do
    article = Article.new
    assert_not_nil article.save
  end
end
