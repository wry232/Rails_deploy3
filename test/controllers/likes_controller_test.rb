require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get likes_index_url
    assert_response :success
  end

  test "should get new" do
    get likes_new_url
    assert_response :success
  end

  test "should get show" do
    get likes_show_url
    assert_response :success
  end

  test "should get edit" do
    get likes_edit_url
    assert_response :success
  end

end
