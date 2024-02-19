require "test_helper"

class JoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get joins_index_url
    assert_response :success
  end

  test "should get new" do
    get joins_new_url
    assert_response :success
  end

  test "should get create" do
    get joins_create_url
    assert_response :success
  end

  test "should get edit" do
    get joins_edit_url
    assert_response :success
  end

  test "should get update" do
    get joins_update_url
    assert_response :success
  end

  test "should get show" do
    get joins_show_url
    assert_response :success
  end

  test "should get destroy" do
    get joins_destroy_url
    assert_response :success
  end
end
