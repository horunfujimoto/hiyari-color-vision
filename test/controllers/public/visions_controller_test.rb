require "test_helper"

class Public::VisionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_visions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_visions_show_url
    assert_response :success
  end

  test "should get new" do
    get public_visions_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_visions_edit_url
    assert_response :success
  end
end
