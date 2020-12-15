require 'test_helper'

class WrapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wraps_index_url
    assert_response :success
  end

  test "should get new" do
    get wraps_new_url
    assert_response :success
  end

  test "should get show" do
    get wraps_show_url
    assert_response :success
  end

  test "should get edit" do
    get wraps_edit_url
    assert_response :success
  end

end
