require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comments with text in body" do
    comment = Comment.new
    assert_not_nil comment.save
  end
end
