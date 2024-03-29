require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
    @post = @post_comment.post
  end

  test 'should create post comment' do
    post post_comments_url(@post), params: { post_comment: { body: @post_comment.body } }

    assert_redirected_to post_url(@post)
  end

  test "should get edit" do
    get edit_post_comment_url(@post, @post_comment)
    assert_response :success
  end

  test 'should update post comment' do
    patch post_comment_url(@post, @post_comment), params: { post_comment: { body: @post_comment.body } }

    @post_comment.reload

    assert_redirected_to post_url(@post)
  end

  test 'should destroy post comment' do
    delete post_comment_url(@post, @post_comment)

    assert { !PostComment.exists?(@post_comment.id) }

    assert_redirected_to post_url(@post)
  end
end
